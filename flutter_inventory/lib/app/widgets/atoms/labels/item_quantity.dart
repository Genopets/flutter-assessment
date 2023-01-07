import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';

class ItemQuantity extends StatelessWidget {
  const ItemQuantity({super.key, required this.quantity, required this.color});
  final String quantity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'x',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: color,
                height: .79,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
        ),
        Subheading(
          quantity,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
