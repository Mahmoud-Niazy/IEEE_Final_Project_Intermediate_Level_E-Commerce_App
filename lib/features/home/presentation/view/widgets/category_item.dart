import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
  final bool isSelected ;

  const CategoryItem({
    super.key,
    required this.categoryTitle,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Text(
        categoryTitle,
        style: isSelected ? AppStyles.style15Black.copyWith(color: Colors.white) : AppStyles.style15Black,
      ),
    );
  }
}
