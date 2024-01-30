import 'package:e_commerce/core/app_assets/app_assets.dart';
import 'package:e_commerce/core/app_styles/app_styles.dart';
import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/choose_login_or_register_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  static var pageController = PageController();

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                onBoardingData[index]['image'],
                                fit: BoxFit.cover,
                                width: screenSize.width * .8,
                              ),
                              SizedBox(
                                height: screenSize.height * .05,
                              ),
                              Text(
                                onBoardingData[index]['title'],
                                style: AppStyles.style25
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: screenSize.height * .015,
                              ),
                              const Text(
                                'Get any product you want with big offers',
                                style: AppStyles.style16Grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: onBoardingData.length,
                  ),
                  Positioned(
                    right: screenSize.width * 0.01,
                    top: screenSize.height * .01,
                    child: CustomTextButton(
                      title: 'Skip',
                      onPressed: () {
                        navigateAndRemoveUntil(
                          context: context,
                          screen: const ChooseLoginOrRegisterView(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * .04,
                vertical: screenSize.height * .01,
              ),
              child: PageIndicator(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> onBoardingData = [
  {
    'title': 'Easy Shopping',
    'image': AppAssets.onBoarding1,
  },
  {
    'title': 'All Categories',
    'image': AppAssets.onBoarding3,
  },
  {
    'title': 'Big Sales',
    'image': AppAssets.onBoarding2,
  },
];
