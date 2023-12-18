import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget{
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}