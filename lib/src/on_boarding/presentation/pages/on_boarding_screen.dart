import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_top_tech/core/common/views/error_page.dart';
import 'package:next_top_tech/core/common/views/welcome_page.dart';
import 'package:next_top_tech/src/news_list/presentataion/pages/news_list_screen.dart';
import 'package:next_top_tech/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:next_top_tech/src/on_boarding/presentation/pages/intro_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          print(state);
          if (state is OnBoardingStatus && !state.isFirstTimer) {
            Navigator.pushReplacementNamed(context, NewsListScreen.routeName);
          } else if (state is OnBoardingStatus && state.isFirstTimer) {
            Navigator.pushReplacementNamed(context, IntroPage.routePage);
          } else if (state is OnBoardingError) {
            Navigator.pushReplacementNamed(context, ErrorPage.routeName);
          }
        },
        builder: (context, state) {
          return const WelcomePage();
        },
      ),
    );
  }
}
