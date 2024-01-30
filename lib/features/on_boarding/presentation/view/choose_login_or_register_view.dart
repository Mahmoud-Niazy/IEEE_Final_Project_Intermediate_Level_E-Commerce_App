import 'package:e_commerce/core/app_styles/app_styles.dart';
import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_assets/app_assets.dart';

class ChooseLoginOrRegisterView extends StatelessWidget {
  const ChooseLoginOrRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    AppAssets.chooseLoginOrRegisterView,
                    fit: BoxFit.cover,
                    height: screenSize.height * .5,
                    width: screenSize.width * .8,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .05,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      width: screenSize.width * .1,
                    ),
                    SizedBox(
                      width: screenSize.width * .05,
                    ),
                    Expanded(
                      child: Text(
                        'Everything you need is in one place',
                        style: AppStyles.style25.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .1,
                ),
                CustomButton(
                  onPressed: () {
                    navigate(
                      context: context,
                      screen: const LoginView(),
                    );
                  },
                  title: 'Login',
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                CustomButton(
                  onPressed: () {
                    navigate(
                      context: context,
                      screen: const RegisterView(),
                    );
                  },
                  title: 'Register',
                  isButtonWhite: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
