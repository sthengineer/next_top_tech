import 'package:flutter/material.dart';

import 'package:next_top_tech/core/res/colors.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    required this.label,
    required this.onPressed,
    super.key,
    this.color = AppColors.greenishTeal,
    this.badge = 0,
    this.loading = false,
    this.loadingSize = 28.0,
    this.enabled = true,
    this.onDisablePressed,
  });
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final int badge;
  final bool loading;
  final double loadingSize;
  final bool enabled;
  final VoidCallback? onDisablePressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OutlinedButton(
          onPressed: enabled ? onPressed : onDisablePressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: enabled ? color : Theme.of(context).disabledColor,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            side: BorderSide(
              color: enabled ? color : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: loading
              ? SizedBox(
                  height: loadingSize,
                  width: loadingSize,
                  child: const CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                )
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.white),
                ),
        ),
        if (badge > 0)
          Positioned(
            // draw a red marble
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
