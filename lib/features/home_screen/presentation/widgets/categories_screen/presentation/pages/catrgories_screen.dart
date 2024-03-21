import 'package:cedage/core/utils/color_manager.dart';
import 'package:cedage/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/utils/constantes.dart';
import '../manager/categories_screen_cubit.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        // CategoriesCubit cubit = BlocProvider.of(context);
        if (state is RetriveCategoriesSuccsess &&
            CategoriesCubit.categoriesList!.categories!.isEmpty) {
          return Container(
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
                      "لا يوجد اقسام للعرض",
                      style: TextStyle(color: ColorManager.myGrayLite),
                    )
                  ],
                ),
              )));
        }
        return Container(
          width: double.infinity,
          height: getSectionHeight(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: state is RetriveCategoriesLoading
                ? Container(
                    height: getSectionHeight(context),
                    child: const Center(child: CircularProgressIndicator()))
                : SingleChildScrollView(
                  child: GridView.custom(
                                shrinkWrap: true,
                                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? (MediaQuery.of(context).size.width /200).floor() : (MediaQuery.of(context).size.width /100).floor(),
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 4,
                  pattern: [
                    WovenGridTile(1),
                    // WovenGridTile(
                    //   5 / 7,
                    //   crossAxisRatio: 0.9,
                    //   alignment: AlignmentDirectional.centerEnd,
                    // ),
                  ],
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: CategoriesCubit
                      .categoriesList?.categories?.length,
                      (context, index) => CategoryItem(
                        onTap: () {
                          CategoriesCubit.currentCategoryName = CategoriesCubit
                              .categoriesList?.categories?[index].name ??
                              "";
                          context.goNamed(RoutesManager.productsScreen,
                              pathParameters: {'categoryId': CategoriesCubit
                                  .categoriesList?.categories?[index].id ??
                                  "",});
                          // cubit.getProductsByCategory(CategoriesCubit.categoriesList?.categories?[index].id);
                        },
                        height: 250,
                        imageUrl: CategoriesCubit
                            .categoriesList?.categories?[index].imageUrl ??
                            "",
                        name: CategoriesCubit
                            .categoriesList?.categories?[index].name ??
                            "",
                      ),
                                ),
                              ),
                )
            /*MasonryGridView.count(
                    crossAxisCount: 6,

                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        CategoriesCubit.categoriesList?.categories?.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        onTap: () {
                          context.go(RoutesManager.productsScreen);
                          // cubit.getProductsByCategory(CategoriesCubit.categoriesList?.categories?[index].id);
                        },
                        height: (index % 5 + 1) * 100,
                        imageUrl: CategoriesCubit
                                .categoriesList?.categories?[index].imageUrl ??
                            "",
                        name: CategoriesCubit
                                .categoriesList?.categories?[index].name ??
                            "",
                      );
                    },
                  )*/,
          ),
        );
      },
    );
  }
}
