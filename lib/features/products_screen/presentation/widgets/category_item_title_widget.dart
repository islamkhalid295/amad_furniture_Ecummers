import 'package:amad_furniture/features/products_screen/presentation/widgets/sub_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';

class CategoryTitleItem extends StatelessWidget {
  const CategoryTitleItem(
      {super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    CategoriesCubit cubit = BlocProvider.of(context);
    return ExpansionTile(

      title: InkWell(child: Text(title),onTap: (){
        cubit.getProductsByCategory(CategoriesCubit.categoriesList!.categories![index].id);
      }),
      children:
          CategoriesCubit.categoriesList!.categories![index].subcategories!
              .map((e) => SubCategoryItem(
                    title: e.name ?? "",
                    onPressed: (){
                     cubit.getProductsBySubCategory(CategoriesCubit.categoriesList!.categories![index].id??"65aba82125715658c6d165c3", e.id??"2");
                    },
                  ))
              .toList(),
    );
  }
}
