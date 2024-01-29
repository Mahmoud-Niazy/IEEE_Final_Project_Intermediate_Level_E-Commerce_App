import 'package:http/http.dart' as http;
import 'package:e_commerce/core/app_assets/app_assets.dart';
import 'package:e_commerce/core/app_styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/back_button.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/api_services/api_services.dart';

class RegisterView extends StatelessWidget {
  static TextEditingController fNameController = TextEditingController();
  static TextEditingController lNameController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

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
              child:
              Column(
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
                      style: AppStyles.style18,
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
                              Text(
                                'First Name',
                                style: AppStyles.style20,
                              ),
                              SizedBox(
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Name',
                                style: AppStyles.style20,
                              ),
                              SizedBox(
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

                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> registrationData = {
                            'email': RegisterView.emailController.text,
                            'username': RegisterView.userNameController.text,
                            'password': RegisterView.passwordController.text,
                            'name': {
                              'firstname': RegisterView.fNameController.text,
                              'lastname': RegisterView.lNameController.text,
                            },
                            'phone': RegisterView.phoneController.text,
                          };

                          try {
                            http.Response response = await apiServices.postData(
                              path: 'users',
                              data: registrationData,
                            );

                            print('Response Status Code: ${response.statusCode}');
                            print('Response Body: ${response.body}');

                            if (response.statusCode == 200) {
                              print('User registration successful');
                            } else {
                              print('Registration failed');
                            }
                          } catch (error) {
                            // Handle other errors
                            print('Error during registration: $error');
                          }
                        }
                      },
                      title: 'Register'),

                    SizedBox(
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
