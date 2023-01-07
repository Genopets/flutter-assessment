import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/widgets/atoms/typewriter/text_decoding_controller.dart';

class TextScrambler extends StatefulWidget {
  const TextScrambler(
    this.data, {
    this.shouldDecode = true,
    Key? key,
    this.style,
    this.textAlign,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.controller,
    this.effectDuration,
  }) : super(key: key);

  final String data;
  final TextStyle? style;
  final bool softWrap;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextDecodingController? controller;
  final Duration? effectDuration;
  final bool shouldDecode;

  @override
  _TextScramblerState createState() => _TextScramblerState();
}

class _TextScramblerState extends State<TextScrambler> {
  late TextDecodingController _controller;
  String _data = '';
  late int _textLength = 0;
  late List<Widget> textChars = [];
  final String _scrambleText =
      'abcdefghijklmnopqrstuvwxyz01234567890!@#&*()_}=-]';

  void _effectCallback(String data) {
    setState(() {
      _data = data;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _textLength = widget.data.length;
      textChars = List.generate(
          _textLength, (index) => _styledText(_scrambleText[index]));

      _controller =
          widget.controller ?? TextDecodingController(_effectCallback);
    });
    if (widget.shouldDecode) {
      _controller.setData(widget.data);
    } else {
      setState(() {
        _data = widget.data;
      });
    }
  }

  @override
  void didUpdateWidget(TextScrambler oldWidget) {
    if (oldWidget.data != widget.data || widget.shouldDecode == true) {
      _controller.setData(
        widget.data,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void init() {
    for (var i = 0; i < _textLength; i++) {}
  }

  Widget _styledText(String c) {
    return Text(
      c,
      style: widget.style,
      textAlign: widget.textAlign,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: widget.style,
      textAlign: widget.textAlign,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
    );
  }
}
