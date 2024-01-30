import 'package:flutter/material.dart';

class CustomRateWidget extends StatelessWidget {
  final int rate;

  const CustomRateWidget({
    super.key,
    this.rate = 3
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 100,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: rate >= index + 1 ? Colors.blue : Colors.grey,
              size: 20,
            ),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
