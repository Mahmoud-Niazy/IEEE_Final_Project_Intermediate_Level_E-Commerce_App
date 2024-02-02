import 'package:e_commerce/features/favourites/presentation/manager/favourites_provider/favourite_provider.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

class FavouriteItem extends StatelessWidget {
  final ProductModel product;

  const FavouriteItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              product.image,
              height: screenSize.width * .35,
            ),
          ),
          SizedBox(
            width: screenSize.width * .05,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  product.title,
                  style: AppStyles.style15Black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      '${product.price} \$',
                      style: AppStyles.style18Grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer<FavouritesProvider>(
                      builder: (context,favProvider,child){
                        return CustomIconButton(
                          onPressed: () async{
                            if(favProvider.favIds.contains(product.id)){
                              favProvider.removeProductFromFavorites(product);
                            }
                            else{
                              favProvider.addProductToFavorites(product: product);
                            }
                          },
                          icon:Icons.favorite,
                          color: favProvider.favIds.contains(product.id)? Colors.red : Colors.grey,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
