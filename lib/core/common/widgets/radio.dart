import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonRadio<T> extends StatelessWidget {
  const ButtonRadio({
    required this.value,
    required this.title,
    super.key,
    this.groupValue,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              groupValue == value
                  ? 'assets/icons/radio_on.svg'
                  : 'assets/icons/radio_off.svg',
            ),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
      ),
    );
  }
}
