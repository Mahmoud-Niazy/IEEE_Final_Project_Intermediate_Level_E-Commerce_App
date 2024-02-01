import 'package:e_commerce/core/app_assets/app_assets.dart';
import 'package:e_commerce/core/app_styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_profile_icons.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/http_services/http_services.dart';
import '../../../../core/widgets/custom_forward_button.dart';
import '../../../auth/presentation/view/login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, dynamic>? profileData;
bool isLoading=false;
  @override
  void initState() {
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    setState(() {
      isLoading=true;
    });
    try {
      var data = await HttpServices.getData(path: 'users/1');
      setState(() {
        profileData = data;
        isLoading=false;
       });

    } catch (error) {
      print('Error fetching profile data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: isLoading==true? const Center(
        child: CircularProgressIndicator(),):
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('${AppAssets.userImage}'),
                ),
                const SizedBox(width:  30),
                Text(
                  ' ${profileData?['username'] }',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),  ],
            ),


            const SizedBox(height: 16),
            Text(
              ' ${profileData?['name']['firstname'] }',
              style: AppStyles.style18Black,
            ),
            Text(
              ' ${profileData?['name']['lastname'] }',
              style: AppStyles.style18Grey,
            ),
            const SizedBox(height: 30),
            Text('Profile',style: AppStyles.style18Black),
            SizedBox(height: 20,),
            Row(  mainAxisAlignment:MainAxisAlignment.spaceBetween ,children:
            [  CustomProfileIconButton(icon: Icons.shopping_cart, iconColor: Color(0xFFe17e48), containerColor: Color(0xFFfbf0e6) ),
              Text('Carts',style: AppStyles.style15Black,),
              CustomForwardButton()  ]),
            SizedBox(height: 30,),
            Text('User Information',style: AppStyles.style18Black,),
            SizedBox(height: 20,),
            Row( children: [
              CustomProfileIconButton(icon: Icons.email_outlined,  iconColor: Color(0xFF6d58f5), containerColor: Color(0xFFebe9fd)),
              Text(
                ' ${profileData?['email'] }',
                style: AppStyles.style15Black,
              ),
               ], ),
            SizedBox(height: 10,),
            Row(
                children: [CustomProfileIconButton(icon: Icons.phone, iconColor:Color(0xFF6da9e5), containerColor: Color(0xFFebf6fe)),
                  Text(
                    ' ${profileData?['phone'] }',
                   style: AppStyles.style15Black,),

                   ]),
            SizedBox(height: 30,),
            CustomTextButton( title: 'Sign out', onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()) )
           ; } )
          ],
        ),
      ),
    );
  }
}