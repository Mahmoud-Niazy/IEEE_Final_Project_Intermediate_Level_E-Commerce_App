import 'package:e_commerce/core/functions/navigation.dart';
import 'package:e_commerce/core/widgets/custom_icon_button.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/presentation/view/product_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/app_sqflite/model.dart';
import '../../../../core/app_sqflite/sql.dart';
import '../../../../core/app_styles/app_styles.dart';

class FavouritesView extends StatefulWidget{
  const  FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {

  late List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
            appBar: AppBar(title: Text('Favourite',style: AppStyles.styleBlue,),),
              body:
            GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 2.4,
            ),
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              ProductModel products = productsList[index];
              return InkWell(
                onTap: (){
navigate(context: context, screen: ProductDetailsView(productId: products.id));
                },
                child: Card(
                  color: Color(0xffFFFFFFF),
                  child:
                  Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.35,
                        height: screenSize.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                    style: AppStyles.style20,)),

                              Text(products.category,style: AppStyles.style16Grey,),
SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text('\$${products.price}',style: AppStyles.style18Black,),
                                  SizedBox(width: screenSize.width  * 0.2,),
                                  CustomIconButton(onPressed:(){}, icon: Icons.favorite,),
                                ],
                              ),

                              SizedBox(height: 10,),
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