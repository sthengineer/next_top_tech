import 'package:flutter/material.dart';

import 'package:next_top_tech/core/res/colors.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    required this.label,
    super.key,
    this.onPressed,
    this.color = AppColors.greenishTeal,
    this.badge = 0,
    this.loading = false,
    this.loadingSize = 28.0,
  });

  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final int badge;
  final bool loading;
  final double loadingSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            side: BorderSide(color: color, width: 1.5),
          ),
          child: loading
              ? SizedBox(
                  height: loadingSize,
                  width: loadingSize,
                  child: CircularProgressIndicator(color: color),
                )
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color),
                ),
        ),
        if (badge > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                '$badge',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
