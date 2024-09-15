import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_top_tech/core/extensions/context_extension.dart';

import 'package:next_top_tech/src/on_boarding/domain/entities/page_content.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    required this.pageContent,
    super.key,
  });

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(80),
          child: SvgPicture.asset(
            pageContent.image,
            height: 256,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            pageContent.title,
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
