import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/core/widgets/custom_icon_button.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/presentation/view/product_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_sqflite/model.dart';
import '../../../../core/app_sqflite/sql.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../manager/favourite_provider.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  late List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return FutureBuilder<List<ProductModel>>(
      future: Sql.instance.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          productsList = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Favourite',
                  style: AppStyles.styleBlue,
                ),
              ),
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  ProductModel products = productsList[index];
                  return InkWell(
                    onTap: () {
                      navigate(
                          context: context,
                          screen: ProductDetailsView(productId: products.id));
                    },
                    child: Card(
                      color: Color(0xffFFFFFFF),
                      child: Row(
                        children: [
                          Container(
                            width: screenSize.width * 0.35,
                            height: screenSize.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(products.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    products.title,
                                    style: AppStyles.style20,
                                  )),
                                  Text(
                                    products.category,
                                    style: AppStyles.style16Grey,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          '\$${products.price}',
                                          style: AppStyles.style18Black,
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.2,
                                        ),
                                        Selector<FavouriteProvider, dynamic>(
                                          selector: (context, favouriteProvider) =>
                                              favouriteProvider.isProductInFavorites(products.id),
                                          builder: (context, isProductInFavorites,_) {
                                            return CustomIconButton(
                                              onPressed: () async {
                                                final favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);

                                                if (isProductInFavorites) {
                                                  await favouriteProvider.removeProductFromFavorites(products.id);
                                                } else {
                                                  await favouriteProvider.addProductToFavorites(products.id);
                                                }
                                              },
                                              icon: Icons.favorite,
                                              color: isProductInFavorites ? Colors.red : Colors.grey,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
