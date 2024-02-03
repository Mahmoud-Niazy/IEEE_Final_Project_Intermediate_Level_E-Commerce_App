import 'package:e_commerce/core/cache_helper/cache_helper.dart';
import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:e_commerce/features/profile/presentation/manager/profile_provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_assets/app_assets.dart';
import '../../../../core/app_styles/app_styles.dart';
import 'widgets/custom_forward_button.dart';
import 'widgets/custom_profile_icons.dart';
import '../../../auth/presentation/view/login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          if (profileProvider.isUserDataLoading == false) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(AppAssets.userImage),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            profileProvider.user.userName,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 16),
                      // Text(
                      //   ' ${profileData?['name']['firstname'] }',
                      //   style: AppStyles.style18Black,
                      // ),
                      // Text(
                      //   ' ${profileData?['name']['lastname'] }',
                      //   style: AppStyles.style18Grey,
                      // ),
                      SizedBox(
                        height: screenSize.height * .05,
                      ),
                      const Text(
                        'Profile',
                        style: AppStyles.style18Black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomProfileIconButton(
                                    icon: Icons.shopping_cart,
                                    iconColor: Color(0xFFe17e48),
                                    containerColor: Color(0xFFfbf0e6)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Carts',
                                  style: AppStyles.style15Black,
                                ),
                              ],
                            ),
                            CustomForwardButton()
                          ]),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'User Information',
                        style: AppStyles.style18Black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const CustomProfileIconButton(
                              icon: Icons.email_outlined,
                              iconColor: Color(0xFF6d58f5),
                              containerColor: Color(0xFFebe9fd)),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            profileProvider.user.email,
                            style: AppStyles.style15Black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const CustomProfileIconButton(
                            icon: Icons.phone,
                            iconColor: Color(0xFF6da9e5),
                            containerColor: Color(0xFFebf6fe)),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          profileProvider.user.phone,
                          style: AppStyles.style15Black,
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          title: 'Sign out',
                          onPressed: () {
                            CacheHelper.removeData(key: 'token');
                            navigateAndRemoveUntil(
                              context: context,
                              screen: const LoginView(),
                            );
                          })
                    ],
                  ),
                ),
              ),
            );
          }
          return const CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
