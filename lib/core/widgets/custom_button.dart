import 'package:flutter/material.dart';

import '../app_styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;

  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style:
                AppStyles.style18.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
