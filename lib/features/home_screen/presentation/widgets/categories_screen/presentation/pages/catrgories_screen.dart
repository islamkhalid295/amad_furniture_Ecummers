import 'package:amad_furniture/features/home_screen/presentation/widgets/categories_screen/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../../core/utils/constantes.dart';
import '../../../../../../../core/utils/locator.dart';
import '../manager/categories_screen_cubit.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(sl())..retriveCategories(),

      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: getSectionHeight(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state is RetriveCategoriesLoading  ? Container(
                  height: getSectionHeight(context),
                  child: Center(child: CircularProgressIndicator())):MasonryGridView.count(
                crossAxisCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemCount: CategoriesCubit.categoriesList?.categories?.length,
                itemBuilder: (context, index) {
                  return CategoryItem(height: (index % 4 + 2) * 100,
                    imageUrl: CategoriesCubit.categoriesList!.categories![index].imageUrl ?? "",
                    name: CategoriesCubit.categoriesList!.categories![index].name ?? "",);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
