import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  final IconData icon ;
  final void Function()? onPressed ;

  const CustomIconButton({super.key,
    required this.onPressed,
    required this.icon,
});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon
      ),
      onPressed: onPressed,
    );
  }
}