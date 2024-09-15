import 'package:flutter/material.dart';

import 'package:next_top_tech/core/res/colors.dart';

class CarouselPageIndicator extends StatelessWidget {
  const CarouselPageIndicator({
    required this.controller,
    required this.current,
    required this.count,
    super.key,
    this.padding = const EdgeInsets.all(24),
  });

  final PageController controller;
  final int current;
  final int count;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 16,
        child: ListView.separated(
          itemCount: count,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(
                Icons.circle,
                color: (index == current)
                    ? AppColors.greenishTeal
                    : AppColors.greySoul,
                size: 16,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 8);
          },
        ),
      ),
    );
  }
}
