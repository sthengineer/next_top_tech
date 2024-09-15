import 'package:flutter/material.dart';

import 'package:next_top_tech/core/common/widgets/cards/main_card.dart';

class ShadowedCard extends MainCard {
  const ShadowedCard({
    required this.offset,
    required Widget child,
    required Color color,
    required EdgeInsets margin,
    required double radius,
    required this.shadowRadius,
    required this.shadowColor,
  }) : super(color, margin, child, radius);
  final double shadowRadius;
  final Color shadowColor;
  final Offset offset;

  @override
  Widget buildWidget() {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: shadowRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
