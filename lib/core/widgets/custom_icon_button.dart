import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  final IconData icon ;
  final void Function()? onPressed ;
  final Color? color;

  const CustomIconButton({super.key,
    required this.onPressed,
    required this.icon,
    this.color,
});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon
      ),
      onPressed: onPressed,
      color: color,
    );
  }
}