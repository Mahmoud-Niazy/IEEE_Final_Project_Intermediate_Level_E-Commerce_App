import 'package:e_commerce/core/api_services/api_services.dart';
import 'package:e_commerce/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';

void main(){
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterView(),
    );
  }
}