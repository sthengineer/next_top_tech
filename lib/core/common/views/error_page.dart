import 'package:flutter/material.dart';
import 'package:next_top_tech/core/common/widgets/primary_error_widget.dart';
import 'package:next_top_tech/core/extensions/context_extension.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  static const String routeName = '/error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: PrimaryErrorWidget(errorMassage: context.l.pageNotFound),
        ),
      ),
    );
  }
}
