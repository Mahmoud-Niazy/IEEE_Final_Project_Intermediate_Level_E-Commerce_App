import 'package:flutter/material.dart';
import '../app_styles/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed ;
  final double? fontSize ;


  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.style20.copyWith(
          color: Colors.blue,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
