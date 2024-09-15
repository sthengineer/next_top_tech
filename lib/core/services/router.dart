import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_top_tech/core/common/views/error_page.dart';
import 'package:next_top_tech/core/common/views/welcome_page.dart';
import 'package:next_top_tech/core/services/injection_container.dart';
import 'package:next_top_tech/src/news_list/presentataion/bloc/news_list_bloc.dart';
import 'package:next_top_tech/src/news_list/presentataion/pages/news_list_screen.dart';
import 'package:next_top_tech/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:next_top_tech/src/on_boarding/presentation/pages/intro_page.dart';
import 'package:next_top_tech/src/on_boarding/presentation/pages/on_boarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageBuilder(
        (context) => BlocProvider(
          create: (context) => sl<OnBoardingCubit>(),
          child: const OnBoardingScreen(),
        ),
        settings: settings,
      );
    case IntroPage.routePage:
      return _pageBuilder(
        (context) => BlocProvider.value(
          value: sl<OnBoardingCubit>(),
          child: const IntroPage(),
        ),
        settings: settings,
      );
    case NewsListScreen.routeName:
      return _pageBuilder(
        (context) => BlocProvider(
          create: (context) => sl<NewsListBloc>(),
          child: const NewsListScreen(),
        ),
        settings: settings,
      );
    case ErrorPage.routeName:
      return _pageBuilder(
        (context) => const ErrorPage(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (context) => const ErrorPage(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    pageBuilder: (context, animation, secondaryAnimation) => page(context),
  );
}
