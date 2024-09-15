import 'package:flutter/material.dart';
import 'package:next_top_tech/core/common/widgets/button_secondary.dart';

class NewsTag extends StatelessWidget {
  const NewsTag({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width/3),
      child: ButtonSecondary(
        label: label,
      ),
    );
  }
}
