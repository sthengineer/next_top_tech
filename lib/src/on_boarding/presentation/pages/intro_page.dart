import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_top_tech/core/common/views/loading_view.dart';
import 'package:next_top_tech/core/common/widgets/button_primary.dart';
import 'package:next_top_tech/core/extensions/context_extension.dart';
import 'package:next_top_tech/core/res/colors.dart';
import 'package:next_top_tech/src/news_list/presentataion/pages/news_list_screen.dart';
import 'package:next_top_tech/src/on_boarding/domain/entities/page_content.dart';
import 'package:next_top_tech/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:next_top_tech/src/on_boarding/presentation/pages/widgets/on_boarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  static const String routePage = '/intro_page';

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    final pages = [
      PageContent.introPageOne(
        title: context.l.introPageOne,
      ),
      PageContent.introPageTwo(
        title: context.l.introPageTwo,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 16),
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            print(state);
            if (state is UserCached) {

              Navigator.pushReplacementNamed(context, NewsListScreen.routeName);
            }
          },
          builder: (context, state) => state is CachingFirstTimer
              ? const LoadingView()
              : Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        children: List.generate(
                          pages.length,
                          (index) => OnBoardingBody(pageContent: pages[index]),
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: pages.length,
                      onDotClicked: (index) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 16,
                        activeDotColor: AppColors.greenishTeal,
                        dotColor: AppColors.greyDawn,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ButtonPrimary(
                        label: context.l.introNext,
                        onPressed: () {
                          context.read<OnBoardingCubit>().cacheFirstTimer();
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
