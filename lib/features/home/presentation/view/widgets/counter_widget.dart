import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

//ignore: must_be_immutable
class CounterWidget extends StatefulWidget {
  int count = 1;

   CounterWidget({
    super.key,
    this.count = 1,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          CustomIconButton(
            onPressed: () {
              setState(() {
                if (widget.count > 1) {
                  widget.count--;
                }
              });
            },
            icon: Icons.remove,
          ),
          Text(
            '${widget.count}',
            style: AppStyles.style18Black,
          ),
          CustomIconButton(
            onPressed: () {
              setState(() {
                widget.count++;
              });
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
