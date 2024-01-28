import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import 'package:amad_furniture/features/products_screen/data/models/product_list_model.dart';
import 'package:amad_furniture/features/products_screen/presentation/widgets/category_item_title_widget.dart';
import 'package:amad_furniture/features/products_screen/presentation/widgets/product_item_widget.dart';
import 'package:amad_furniture/features/products_screen/presentation/widgets/sub_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/shop_cart_icon.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if(token == null)
    {
      authanticationCubit.getToken();
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          toolbarHeight: tabBarHeight,
          backgroundColor: ColorManager.myWhite,
          leading: Padding(
            padding: EdgeInsets.only(
                right: (90 * MediaQuery.of(context).size.width / 1235)),
            child: Image.asset("assets/icons/Link → logo.png.png"),
          ),
          leadingWidth: MediaQuery.of(context).size.width < 800
              ? 200 * MediaQuery.of(context).size.width / 800
              : 200,
          title: DefaultTextButton(onPressed: (){context.go(RoutesManager.homeScreen);}, title: "الرئيسية"),

          titleSpacing: 100,
          // title: TabBar(
          //   controller: _tabController,
          //   onTap: (index) {
          //     _scrollController.scrollToIndex(index,
          //         preferPosition: AutoScrollPosition.begin);
          //     _onSectionChange(index);
          //   },
          //   tabs: HomeScreenCubit.tabBarTabs,
          //   indicatorColor: ColorManager.myYellow,
          //   labelStyle: const TextStyle(
          //     color: Colors.black,
          //     fontSize: 16,
          //     fontFamily: 'Almarai',
          //     fontWeight: FontWeight.w700,
          //   ),
          //   indicatorSize: TabBarIndicatorSize.label,
          //   dividerHeight: 0,
          //   labelPadding: EdgeInsets.symmetric(
          //       horizontal: 40 * MediaQuery.of(context).size.width / 1440),
          //   isScrollable: true,
          //
          // ),
          actions: [
            SizedBox(
              width: 30 * MediaQuery.of(context).size.width / 1440,
            ),
            ShopCart(),
            SizedBox(
              width: 30 * MediaQuery.of(context).size.width / 1440,
            ),
            NavigationBarSignInButton(),
            // Container(
            //   decoration: BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius: BorderRadius.circular(10)),
            //   child: TextButton(onPressed: ()=> context.go('/authentication/create_account'), child: Text("تسجيل الدخول",style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 16,
            //     fontFamily: 'Almarai',
            //     fontWeight: FontWeight.w700,
            //   ),)),
            // ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            CategoriesCubit cubit = BlocProvider.of(context);
            if(CategoriesCubit.productsListModel == null && !CategoriesCubit.poductsLoaded){
              CategoriesCubit.poductsLoaded = true;
              cubit.getProducts();
            }
            if(CategoriesCubit.categoriesList == null && !CategoriesCubit.categoryLoaded){
              CategoriesCubit.categoryLoaded = true;
              cubit.retriveCategories();
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: ColorManager.myGrayLite))),
                  width: 250,
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    DefaultSelectableText(
                      "الأقسام",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    SubCategoryItem(
                        title: "الكل",
                        onPressed: () {
                          cubit.getProducts();
                          CategoriesCubit.currentCategoryName = "الكل";
                        }),
                    state is RetriveCategoriesLoading ||
                            CategoriesCubit.categoriesList == null
                        ? Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView.builder(
                            itemCount: CategoriesCubit
                                .categoriesList?.categories!.length,
                            itemBuilder: (context, index) => CategoryTitleItem(
                                title: CategoriesCubit.categoriesList
                                        ?.categories![index].name ??
                                    "",
                                index: index),
                          )),
                  ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: CategoriesCubit.productsListModel == null
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: DefaultSelectableText(CategoriesCubit.currentCategoryName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: AlignedGridView.count(
                                    crossAxisCount:
                                        ((MediaQuery.of(context).size.width - 250) /
                                                210)
                                            .floor(),
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    itemCount: CategoriesCubit
                                        .productsListModel?.products!.length,
                                    itemBuilder: (context, index) {
                                      return ProductItem(
                                        product: Product(
                                            price: CategoriesCubit.productsListModel
                                                ?.products![index].price,
                                            id: CategoriesCubit.productsListModel
                                                ?.products![index].id,
                                            name: CategoriesCubit.productsListModel
                                                ?.products![index].name,
                                            discount: CategoriesCubit
                                                .productsListModel
                                                ?.products![index]
                                                .discount,
                                            availableAmount: CategoriesCubit
                                                .productsListModel
                                                ?.products![index]
                                                .availableAmount,
                                            imageUrl: CategoriesCubit
                                                .productsListModel
                                                ?.products![index]
                                                .imageUrl),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ) /*GridView.builder(
                              itemCount: 9*/ /*CategoriesCubit
                                  .productsListModel?.products?.length ?? 0*/ /*,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    ((MediaQuery.of(context).size.width-250) /
                                            210)
                                        .floor(),
                                childAspectRatio: max(0.5, 370 / ((MediaQuery.of(context).size.width)/5))
                                */ /*(MediaQuery.of(context).size.height)/(MediaQuery.of(context).size.width)*/ /* ,
                              ),
                              itemBuilder: (context, index) => ProductItem(
                                product: Product(
                                    price: CategoriesCubit
                                        .productsListModel?.products![1].price,
                                    id: CategoriesCubit
                                        .productsListModel?.products![1].id,
                                    name: CategoriesCubit
                                        .productsListModel?.products![1].name,
                                    discount: CategoriesCubit.productsListModel
                                        ?.products![1].discount,
                                    availableAmount: CategoriesCubit
                                        .productsListModel
                                        ?.products![1]
                                        .availableAmount,
                                    imageUrl: CategoriesCubit.productsListModel
                                        ?.products![1].imageUrl),
                              ),
                            )*/
                      ,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
  }
}
