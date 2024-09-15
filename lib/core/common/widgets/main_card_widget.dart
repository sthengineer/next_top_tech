import 'package:flutter/material.dart';

import 'package:next_top_tech/core/common/widgets/cards/shadowed_card.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    required this.child,
    super.key,
    this.margin,
    this.color = Colors.white,
    this.onPressed,
    this.padding,
    this.radius,
  });

  final double? radius;
  final Widget child;
  final EdgeInsets? margin;
  final Color? color;
  final EdgeInsets? padding;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadowedCard(
      color: Theme.of(context).cardColor,
      margin: margin ??
          const EdgeInsets.only(
            top: 8,
            right: 16,
            left: 16,
            bottom: 8,
          ),
      radius: radius == null ? 16 : radius!,
      shadowColor: Colors.black.withOpacity(0.1),
      shadowRadius: 8,
      offset: const Offset(2, 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: Center(child: child),
          ),
        ),
      ),
    ).buildWidget();
  }
}
