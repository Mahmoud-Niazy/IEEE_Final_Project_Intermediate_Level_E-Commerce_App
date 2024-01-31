import 'package:e_commerce/features/cart/presentation/manager/cart_provider/cart_provider.dart';
import 'package:e_commerce/features/layout/presentation/manager/layout_provider/layout_provider.dart';
import 'package:e_commerce/features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/manager/auth_provider/auth_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LayoutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: LayoutView(),
      ),
    );
  }
}
