import 'package:blog_club_app/data.dart';
import 'package:blog_club_app/gen/assets.gen.dart';
import 'package:blog_club_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeDate = Theme.of(context);
    return Scaffold(
      backgroundColor: themeDate.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 8),
              child: Assets.img.background.onboarding.image(),
            )),
            Container(
              height: 270,
              decoration: BoxDecoration(
                  color: themeDate.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                child: Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      itemCount: items.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].title,
                              style: themeDate.textTheme.headlineLarge,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              items[index].description,
                              style: themeDate.textTheme.bodySmall,
                            )
                          ],
                        );
                      },
                    )),
                    Container(
                      height: 60,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: items.length,
                            effect: ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: themeDate.colorScheme.primary,
                                dotColor: themeDate.colorScheme.primary
                                    .withOpacity(0.1)),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (page == items.length - 1) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeState()));
                                }else{
                                  _pageController.animateToPage(page+1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                                }
                              },
                              style: ButtonStyle(
                                  minimumSize: const WidgetStatePropertyAll(
                                    Size(88, 60),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: Icon(page == items.length - 1
                                  ? CupertinoIcons.checkmark_alt
                                  : CupertinoIcons.arrow_right))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
