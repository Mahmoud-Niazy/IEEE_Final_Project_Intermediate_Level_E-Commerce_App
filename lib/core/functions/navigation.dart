import 'package:flutter/material.dart';

navigateAndRemoveUntil({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
    (route) => false,
  );
}

navigate({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigatePop({
  required BuildContext context,
}){
  Navigator.of(context).pop();
}
