import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class SearchWidget extends StatelessWidget{
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 10
            ),
            child: Icon(
              Icons.search,
              color: Colors.black54,
              size: 30,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search about any product',
                hintStyle: AppStyles.style16Grey,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}