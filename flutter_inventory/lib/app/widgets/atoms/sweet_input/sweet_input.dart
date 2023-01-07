import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/fonts.gen.dart';

class SweetInput extends StatefulWidget {
  const SweetInput(
      {Key? key,
      required this.formKey,
      this.label,
      this.disabled = false,
      this.isLoading = false,
      this.preset = ColorPresets.teal,
      this.leftChild,
      this.rightChild,
      this.height = 60,
      this.elevation = 0,
      this.padding,
      this.borderRadius,
      this.controller,
      this.initialValue,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlignVertical,
      this.toolbarOptions,
      this.showCursor,
      this.smartDashesType,
      this.onChange,
      this.margin,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      this.readOnly = false,
      this.autofocus = false,
      this.textAlign = TextAlign.start,
      this.textCapitalization = TextCapitalization.none,
      this.autofillHints,
      required this.placeholder,
      this.placeholderTextStyle,
      this.error,
      this.useTopBorder = false,
      this.showErrorBorder = false})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final ColorPresets preset;
  final bool disabled;

  final double height;
  final double elevation;

  final bool isLoading;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  final String? label;
  final String placeholder;
  final TextStyle? placeholderTextStyle;
  final String? error;
  final Widget? leftChild;
  final Widget? rightChild;
  final bool useTopBorder;
  final bool showErrorBorder;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final ValueChanged<String>? onChange;
  final EdgeInsetsGeometry? margin;
  final List<String>? autofillHints;

  @override
  _SweetInputState createState() => _SweetInputState();
}

class _SweetInputState extends State<SweetInput> {
  final focusNode = FocusNode();

  Widget _leftContent() {
    if (widget.leftChild == null) return const SizedBox.shrink();
    return SizedBox(
      width: 35,
      height: 35,
      child: FittedBox(child: widget.leftChild),
    );
  }

  Widget _rightContent() {
    if (widget.rightChild == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 24,
        height: 24,
        child: FittedBox(child: widget.rightChild),
      ),
    );
  }

  Widget _rightLine(Color _color) {
    return Container(
      width: 1,
      height: 24,
      color: _color.withOpacity(0.2),
      margin:
          widget.rightChild == null ? const EdgeInsets.only(right: 20) : null,
    );
  }

  Widget _mainContent(Color color) {
    final hasError = widget.error != null;
    final theme = GenopetsTheme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.focusNode != null
            ? widget.focusNode?.requestFocus()
            : focusNode.requestFocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: widget.formKey,
              child: FocusScope(
                onFocusChange: (value) {
                  if (!value) {
                    widget.formKey.currentState?.validate();
                  }
                },
                child: TextFormField(
                  onChanged: widget.onChange,
                  focusNode: widget.focusNode ?? focusNode,
                  controller: widget.controller,
                  autocorrect: widget.autocorrect,
                  initialValue: widget.initialValue,
                  keyboardType: widget.keyboardType,
                  textCapitalization: widget.textCapitalization,
                  textInputAction: widget.textInputAction,
                  strutStyle: widget.strutStyle,
                  textDirection: widget.textDirection,
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  autofocus: widget.autofocus,
                  readOnly: widget.readOnly,
                  toolbarOptions: widget.toolbarOptions,
                  showCursor: widget.showCursor,
                  obscuringCharacter: widget.obscuringCharacter,
                  obscureText: widget.obscureText,
                  smartDashesType: widget.smartDashesType,
                  smartQuotesType: widget.smartQuotesType,
                  enableSuggestions: widget.enableSuggestions,
                  autofillHints: widget.autofillHints ?? [],
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  style: TextStyle(
                          fontFamily: FontFamily.balooThambi2,
                          fontSize: 16,
                          color: hasError
                              ? theme.textColor(ColorPresets.pink)
                              : theme.textColor(widget.preset))
                      .merge(widget.style),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: theme.textColor(widget.preset),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(24, 5, 1, 3),
                    suffix: const Padding(padding: EdgeInsets.zero),
                    prefix: const Padding(padding: EdgeInsets.zero),
                    label: Text(
                      widget.placeholder,
                      style: TextStyle(
                        fontFamily: FontFamily.pPMonument,
                        color: hasError
                            ? theme.primaryColor(ColorPresets.pink)
                            : theme.textColor(widget.preset),
                        letterSpacing: 1,
                        fontSize: 14,
                      ).merge(widget.placeholderTextStyle),
                    ),
                    floatingLabelStyle: TextStyle(
                      fontFamily: FontFamily.pPMonument,
                      color: hasError
                          ? theme.primaryColor(ColorPresets.pink)
                          : theme.primaryColor(widget.preset),
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            if (hasError)
              AppPadding(
                child: ContentPadding(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 5),
                    child: Body1(
                      widget.error!,
                      style: TextStyle(
                        fontFamily: FontFamily.pPMonument,
                        color: theme.primaryColor(ColorPresets.pink),
                        letterSpacing: 1,
                        height: 1,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildView(
    BuildContext context,
    Color color,
    LinearGradient gradient,
    ThemeDataT theme,
  ) {
    final hasError = widget.error != null;
    return SizedBox(
      height: !hasError ? widget.height : 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: hasError
                    ? theme.primaryColor(ColorPresets.pink).withOpacity(0.2)
                    : theme.primaryColor(widget.preset).withOpacity(0.2),
              ),
              gradient: theme.hudGradient(widget.preset),
              borderRadius: widget.borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _leftContent(),
                _mainContent(color),
                _rightLine(color),
                _rightContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final gradient = widget.disabled
        ? theme.colors.background.grey
        : theme.gradient(widget.preset);
    final color = widget.disabled
        ? theme.colors.primary.grey
        : theme.primaryColor(widget.preset);

    return _buildView(context, color, gradient, theme);
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }
}
