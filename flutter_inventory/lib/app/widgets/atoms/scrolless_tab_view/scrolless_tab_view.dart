import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// A page view that displays the widget which corresponds to the currently
/// selected tab.
///
/// This widget is typically used in conjunction with a [TabBar].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=POtoEH-5l40}
///
/// If a [TabController] is not provided, then there must be a [DefaultTabController]
/// ancestor.
///
/// The tab controller's [TabController.length] must equal the length of the
/// [children] list and the length of the [TabBar.tabs] list.
///
/// To see a sample implementation, visit the [TabController] documentation.
class ScrollessTabBarView extends StatefulWidget {
  /// Creates a page view with one child per tab.
  ///
  /// The length of [children] must be the same as the [controller]'s length.
  const ScrollessTabBarView({
    Key? key,
    required this.children,
    this.controller,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : super(key: key);

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// One widget per tab.
  ///
  /// Its length must match the length of the [TabBar.tabs]
  /// list, as well as the [controller]'s [TabController.length].
  final List<Widget> children;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  @override
  State<ScrollessTabBarView> createState() => _ScrollessTabBarViewState();
}

class _ScrollessTabBarViewState extends State<ScrollessTabBarView> {
  TabController? _controller;
  late List<Widget> _children;
  late List<Widget> _childrenWithKey;
  int? _currentIndex;
  int _warpUnderwayCount = 0;

  // If the ScrollessTabBarView is rebuilt with a new tab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final newController = widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must either provide an explicit '
          'TabController using the "controller" property, or you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
    }
  }

  @override
  void initState() {
    super.initState();
    _updateChildren();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller?.index;
  }

  @override
  void didUpdateWidget(ScrollessTabBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) _updateTabController();
    if (widget.children != oldWidget.children && _warpUnderwayCount == 0) {
      _updateChildren();
    }
  }

  @override
  void dispose() {
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = null;
    // We don't own the _controller Animation, so it's not disposed here.
    super.dispose();
  }

  void _updateChildren() {
    _children = widget.children;
    _childrenWithKey = KeyedSubtree.ensureUniqueKeysForList(widget.children);
  }

  void _handleTabControllerAnimationTick() {
    if (_warpUnderwayCount > 0 || !_controller!.indexIsChanging) {
      return;
    } // This widget is driving the controller's animation.

    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
      _warpToCurrentIndex();
    }
  }

  Future<void> _warpToCurrentIndex() async {
    if (!mounted) return Future<void>.value();

    final previousIndex = _controller!.previousIndex;
    if ((_currentIndex! - previousIndex).abs() == 1) {
      _warpUnderwayCount += 1;
      _warpUnderwayCount -= 1;
      return Future<void>.value();
    }

    assert((_currentIndex! - previousIndex).abs() > 1);
    final initialPage = _currentIndex! > previousIndex
        ? _currentIndex! - 1
        : _currentIndex! + 1;
    final originalChildren = _childrenWithKey;
    setState(() {
      _warpUnderwayCount += 1;

      _childrenWithKey = List<Widget>.from(_childrenWithKey, growable: false);
      final temp = _childrenWithKey[initialPage];
      _childrenWithKey[initialPage] = _childrenWithKey[previousIndex];
      _childrenWithKey[previousIndex] = temp;
    });

    if (!mounted) return Future<void>.value();
    setState(() {
      _warpUnderwayCount -= 1;
      if (widget.children != _children) {
        _updateChildren();
      } else {
        _childrenWithKey = originalChildren;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _childrenWithKey[_currentIndex ?? 0];
  }
}
