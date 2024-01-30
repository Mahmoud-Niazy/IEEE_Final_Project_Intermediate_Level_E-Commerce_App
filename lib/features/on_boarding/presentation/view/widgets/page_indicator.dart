import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/choose_login_or_register_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_button.dart';

//ignore: must_be_immutable
class PageIndicator extends StatefulWidget {
  PageController pageController;
  static int currentIndex = 0;

  PageIndicator({
    super.key,
    required this.pageController,
  });

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: screenSize.height * .02,
          width: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 8,
              width: 10,
              decoration: BoxDecoration(
                color: PageIndicator.currentIndex == index
                    ? Colors.blue
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemCount: 3,
          ),
        ),
        CustomTextButton(
          title: 'Next',
          onPressed: () {
            if (PageIndicator.currentIndex < onBoardingData.length - 1) {
              setState(() {
                PageIndicator.currentIndex =
                    widget.pageController.page!.toInt() + 1;
                widget.pageController.nextPage(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  curve: Curves.linear,
                );
              });
            } else {
              navigateAndRemoveUntil(
                context: context,
                screen: const ChooseLoginOrRegisterView(),
              );
            }
          },
        ),
      ],
    );
  }
}
