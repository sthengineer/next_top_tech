import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_top_tech/core/common/widgets/button_primary.dart';
import 'package:next_top_tech/core/extensions/context_extension.dart';
import 'package:next_top_tech/core/res/media_res.dart';

class PrimaryErrorWidget extends StatelessWidget {
  const PrimaryErrorWidget({
    required this.errorMassage,
    this.onPress,
    super.key,
  });

  final String errorMassage;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMassage,
            style: context.textTheme.titleLarge,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SvgPicture.asset(
            MediaRes.error,
            height: 256,
          ),
          const SizedBox(height: 16),
          if (onPress != null)
            ButtonPrimary(
              label: 'reload',
              onPressed: () {
                onPress!();
              },
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
