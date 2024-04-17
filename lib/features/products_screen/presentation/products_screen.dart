import 'package:cedage/core/utils/color_manager.dart';
import 'package:cedage/features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import 'package:cedage/features/products_screen/data/models/product_list_model.dart';
import 'package:cedage/features/products_screen/presentation/widgets/category_item_title_widget.dart';
import 'package:cedage/features/products_screen/presentation/widgets/product_item_widget.dart';
import 'package:cedage/features/products_screen/presentation/widgets/sub_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../../cart_screen/presentation/manager/cart_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryId});

  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    CartCubit cartCubit = BlocProvider.of(context);
    CategoriesCubit.productsListModel = null;
    CategoriesCubit.poductsLoaded = false;
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (CartCubit.cart == null) {
      cartCubit.getCart();
    }
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          CategoriesCubit cubit = BlocProvider.of(context);
          if (CategoriesCubit.productsListModel == null &&
              !CategoriesCubit.poductsLoaded) {
            CategoriesCubit.poductsLoaded = true;
            if (categoryId == null) {
              cubit.getProducts();
            } else {
              cubit.getProductsByCategory(categoryId);
            }
          }
          if (CategoriesCubit.categoriesList == null &&
              !CategoriesCubit.categoryLoaded) {
            CategoriesCubit.categoryLoaded = true;
            cubit.retriveCategories();
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediaQuery.of(context).size.width > 600
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              left:
                                  BorderSide(color: ColorManager.myGrayLite))),
                      width: 250,
                      child: Column(children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const DefaultSelectableText(
                          "الأقسام",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        SubCategoryItem(
                            title: "الكل",
                            onPressed: () {
                              cubit.getProducts();
                              CategoriesCubit.currentCategoryName = "الكل";
                            }),
                        state is RetriveCategoriesLoading ||
                                CategoriesCubit.categoriesList == null
                            ? const Center(child: CircularProgressIndicator())
                            : Expanded(
                                child: ListView.builder(
                                itemCount: CategoriesCubit
                                    .categoriesList?.categories!.length,
                                itemBuilder: (context, index) =>
                                    CategoryTitleItem(
                                        title: CategoriesCubit.categoriesList
                                                ?.categories![index].name ??
                                            "",
                                        index: index),
                              )),
                      ]),
                    )
                  : SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: CategoriesCubit.productsListModel == null ||
                            state is GetProductsLoading
                        ? const Center(child: CircularProgressIndicator())
                        : (state is GetProductsSuccsess && CategoriesCubit.productsListModel!.products!.isNotEmpty) ?
                    Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: DefaultSelectableText(
                                  CategoriesCubit.currentCategoryName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AlignedGridView.count(
                                  crossAxisCount: MediaQuery.of(context)
                                              .size
                                              .width >
                                          600
                                      ? ((MediaQuery.of(context).size.width -
                                                  250) /
                                              200)
                                          .floor()
                                      : ((MediaQuery.of(context).size.width) /
                                              150)
                                          .floor(),
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  itemCount: CategoriesCubit
                                      .productsListModel?.products!.length,
                                  itemBuilder: (context, index) {
                                    return ProductItem(
                                      product: Product(
                                          price: CategoriesCubit
                                              .productsListModel
                                              ?.products![index]
                                              .price,
                                          id: CategoriesCubit.productsListModel
                                              ?.products![index].id,
                                          name: CategoriesCubit
                                              .productsListModel
                                              ?.products![index]
                                              .name,
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
                          ) :
                    Container(
                        height: getSectionHeight(context),
                        child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary.withOpacity(0.2),
                              ),
                              height: 300,
                              width: 300,
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.menu, color: ColorManager.myGrayLite),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "لا يوجد منتجات للعرض",
                                    style:
                                    TextStyle(color: ColorManager.myGrayLite),
                                  )
                                ],
                              ),
                            )))/*GridView.builder(
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
