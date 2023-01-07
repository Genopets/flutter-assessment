import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class GenopetsSlider extends StatelessWidget {
  const GenopetsSlider({Key? key, required this.value, required this.onChange})
      : super(key: key);

  final double value;
  final Function(double)? onChange;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    const thumbSize = 12.0;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: theme.colors.primary.teal.withOpacity(0.2),
        trackHeight: 24,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: thumbSize),
        thumbColor: theme.colors.text.grey,
        overlayShape: SliderComponentShape.noThumb,
        trackShape: CustomTrackShape(),
        disabledActiveTrackColor: theme.colors.text.grey.withOpacity(0.2),
        disabledInactiveTrackColor: theme.colors.text.white.withOpacity(0.2),
        disabledThumbColor: theme.colors.text.grey.withOpacity(0.2),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: onChange != null
                ? theme.colors.primary.teal
                : theme.colors.text.grey,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Slider(
          value: value,
          onChanged: onChange,
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
