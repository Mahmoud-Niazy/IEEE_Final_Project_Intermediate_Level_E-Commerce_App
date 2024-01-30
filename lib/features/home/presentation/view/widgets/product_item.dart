import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        child: Column(
          children: [
            Image(
              height: screenSize.height * .15,
              image: NetworkImage(
                product.image,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.style15Black,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.favorite,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
