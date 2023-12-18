import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/view/register_view.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_assets/app_assets.dart';
import '../../../../core/app_styles/app_styles.dart';

class LoginView extends StatelessWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  const LoginView({super.key});

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
          child:
              Form(
                key: formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),

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
                'Login',
                style: AppStyles.style25,
                            ),
                            const SizedBox(
                height: 5,
                            ),
                            const Text(
                'Login to continue using the app',
                style: AppStyles.style18,
                            ),
                  const SizedBox(
                    height: 25,
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
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password ? ',style: TextStyle(color: Color(0xff6e6f72)),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){

                        }

                  }, title: 'Login'),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Don't have an account? "),
                       GestureDetector(
                         onTap: (){
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterView()));
                         },


                           child: Text('Register',style: TextStyle(color: Colors.blue),))
                    ],
                  ),

                          ]),
              )
      ),
    )));
  }
}
