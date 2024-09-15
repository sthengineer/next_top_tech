import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_top_tech/core/res/media_res.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: SvgPicture.asset(MediaRes.welcome, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
