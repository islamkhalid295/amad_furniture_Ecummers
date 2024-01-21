import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../../../core/utils/constantes.dart';
import '../manager/categories_screen_cubit.dart';
import '../widgets/category_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is RetriveCategoriesSuccsess && CategoriesCubit.categoriesList!.categories!.isEmpty)
          return Container(
              height: getSectionHeight(context),
              child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.myYellow.withOpacity(0.2),
                    ),
height: 300,
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                    Icon(Icons.menu,color: ColorManager.myGrayLite),
                    SizedBox(height: 20,),
                    Text("لا يوجد اقسام للعرض",style: TextStyle(color: ColorManager.myGrayLite),)
                                    ],
                                  ),
                  )));
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
                  imageUrl: CategoriesCubit.categoriesList?.categories?[index].imageUrl ?? "",
                  name: CategoriesCubit.categoriesList?.categories?[index].name ?? "",);
              },
            ),
          ),
        );
      },

    );
  }
}
