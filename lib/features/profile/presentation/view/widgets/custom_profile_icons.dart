import 'package:flutter/material.dart';

class CustomProfileIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  const CustomProfileIconButton({
    required this.icon,
    required this.iconColor,
    required this.containerColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}
