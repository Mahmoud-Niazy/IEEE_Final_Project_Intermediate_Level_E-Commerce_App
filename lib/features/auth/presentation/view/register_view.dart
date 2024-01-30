import 'package:e_commerce/core/app_assets/app_assets.dart';
import 'package:e_commerce/core/app_styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/auth_provider/auth_provider.dart';

class RegisterView extends StatelessWidget {
  static TextEditingController fNameController = TextEditingController();
  static TextEditingController lNameController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const CustomBackButton(),
                  Center(
                    child: Image.asset(
                      AppAssets.logo,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Register',
                    style: AppStyles.style25,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Enter Your Personal Information',
                    style: AppStyles.style18Grey,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              style: AppStyles.style20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              title: 'First name',
                              controller: fNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your first name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last Name',
                              style: AppStyles.style20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              title: 'Last name',
                              controller: lNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your last name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Username',
                    style: AppStyles.style20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: 'Enter your user name',
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your user name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Email',
                    style: AppStyles.style20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      if (!emailController.text.contains('@')) {
                        return 'Email is not valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Phone',
                    style: AppStyles.style20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: 'Enter your phone',
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your phone';
                      }
                      if (phoneController.text.length != 11) {
                        return 'Phone must be 11 numbers';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password',
                    style: AppStyles.style20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: 'Enter password',
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    isPassword: true,
                    isSuffixIconShown: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Confirm Password',
                    style: AppStyles.style20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    title: 'Enter confirm password',
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password confirmation';
                      }
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'two passwords are not equal';
                      }
                      return null;
                    },
                    isPassword: true,
                    isSuffixIconShown: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context,authProvider,child){
                      if (authProvider.isRegisterLoading == true) {
                        return const CustomCircularProgressIndicator();
                      }
                      return CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            authProvider.userRegister(
                              context: context,
                              userData:  {
                                'email': RegisterView.emailController.text,
                                'username': RegisterView.userNameController.text,
                                'password': RegisterView.passwordController.text,
                                'name': {
                                  'firstname': RegisterView.fNameController.text,
                                  'lastname': RegisterView.lNameController.text,
                                },
                                'phone': RegisterView.phoneController.text,
                              },
                            );
                          }
                        },
                        title: 'Register',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
