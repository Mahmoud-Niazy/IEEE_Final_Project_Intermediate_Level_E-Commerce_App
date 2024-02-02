import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:e_commerce/features/cart/presentation/manager/cart_provider/cart_provider.dart';
import 'package:e_commerce/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_styles/app_styles.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Cart',
            style: AppStyles.style20,
          ),
          const SizedBox(
            height: 30,
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              if (cartProvider.isCartProductsLoading) {
                return const CustomCircularProgressIndicator();
              }
              return Expanded(
                flex: 6,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartItem(product: cartProvider.cartProducts[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: cartProvider.cartProducts.length,
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: screenSize.height *.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price ',
                    style: AppStyles.style20,
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return Text(
                        '${cartProvider.totalPrice} \$',
                        style: AppStyles.style18Grey,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height *.02,
              ),
              CustomButton(
                onPressed: () {},
                title: 'Add To Cart',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
