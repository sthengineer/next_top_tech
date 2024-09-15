import 'package:flutter/material.dart';

import 'package:next_top_tech/core/common/widgets/cards/main_card.dart';

class BorderedCard extends MainCard {
  const BorderedCard({
    required Color color,
    required Widget child,
    required EdgeInsets margin,
    required double radius,
    required this.borderWidth,
    required this.borderColor,
  }) : super(color, margin, child, radius);
  final double borderWidth;
  final Color borderColor;

  @override
  Widget buildWidget() {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}
