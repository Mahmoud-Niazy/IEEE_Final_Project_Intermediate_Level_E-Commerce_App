import 'package:e_commerce/features/home/presentation/manager/home_provider/home_provider.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/category_item.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/product_item.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_assets/app_assets.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/http_services/http_services.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();




}

class _HomeViewState extends State<HomeView> {
  Map<String, dynamic>? homeData;
  bool isLoading=false;
  @override
  void initState() {
    fetchHomeData();
  }
  Future<void> fetchHomeData() async {
    setState(() {
      isLoading=true;
    });
    try {
      var data = await HttpServices.getData(path: 'users/1');
      setState(() {
        homeData = data;
        isLoading=false;
      });

    } catch (error) {
      print('Error fetching profile data: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()
        ..getAllCategories()
        ..getAllProducts(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [   Text(
                        'Welcome',
                        style: AppStyles.style20,
                      ),
                         Text(
                          ' ${homeData?['name']['firstname'] }',
                          style: AppStyles.style18Black,
                        ),

                      ],
                    ),
                    Container(
                      height: screenSize.height * .1,
                      width: screenSize.width * .15,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppAssets.userImage,
                            ),
                          ),
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                const SearchWidget(),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Selector<HomeProvider, bool>(
                  selector: (context, homeProvider) =>
                      homeProvider.isCategoriesLoading,
                  builder: (BuildContext context, bool isCategoriesLoading,
                      Widget? child) {
                    if (isCategoriesLoading == true) {
                      return const CustomCircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                              categoryTitle: Provider.of<HomeProvider>(context)
                                  .categories[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount:
                            Provider.of<HomeProvider>(context).categories.length,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Selector<HomeProvider, bool>(
                  builder: (BuildContext context, bool isProductsLoading,
                      Widget? child) {
                    if (isProductsLoading == true) {
                      return const CustomCircularProgressIndicator();
                    }
                    return GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 1 / 1.6,
                      crossAxisSpacing: screenSize.width * .03,
                      mainAxisSpacing: screenSize.height * .015,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: Provider.of<HomeProvider>(context)
                          .allProducts
                          .map((product) => ProductItem(
                                product: product,
                              ))
                          .toList(),
                      // itemCount: 2,
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      // ),
                      // itemBuilder: (context,index){
                      //   return const ProductItem();
                      // },
                    );
                  },
                  selector: (BuildContext context, homeProvider) =>
                      homeProvider.isProductsLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
