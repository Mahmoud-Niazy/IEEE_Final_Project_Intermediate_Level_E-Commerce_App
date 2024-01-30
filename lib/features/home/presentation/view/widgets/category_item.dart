import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;

  const CategoryItem({
    super.key,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Text(
        categoryTitle,
        style: AppStyles.style15Black,
      ),
    );
  }
}
