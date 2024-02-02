import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomForwardButton extends StatelessWidget {

  const CustomForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),

      );
  }
}
