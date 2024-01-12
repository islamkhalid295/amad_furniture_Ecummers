import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import '../../features/home_screen/presentation/widgets/categories_screen/data/data_sources/categories_rds.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/domain/repositories/categories_repo.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/domain/use_cases/retrive_categories_uc.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';

import '../../features/home_screen/presentation/widgets/home_slider/data/remote/data_sources/slider_rds.dart';
import '../../features/home_screen/presentation/widgets/home_slider/domain/repositories/slider_repo.dart';
import '../../features/home_screen/presentation/widgets/home_slider/domain/use_cases/retrive_slider_items_uc.dart';
import '../../features/home_screen/presentation/widgets/home_slider/presentation/manager/slider_cubit.dart';
import '../api/api_consummer.dart';
import '../api/dio_consummer.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Features - Slider

  sl.registerFactory(() => SliderCubit(sl()));
  sl.registerLazySingleton(() => RetriveSliderItemsUC(sliderRepo: sl()));
  sl.registerLazySingleton<SliderRepo>(
          () => SliderRepoImp(sliderRDS:  sl()));
  sl.registerLazySingleton<SliderRDS>(
          () => SliderRdsImp(client: sl()));


  // Features - Categories
  sl.registerFactory(() => CategoriesCubit(sl()));
  sl.registerLazySingleton(() => RetriveCategoriesUC(sliderRepo: sl()));
  sl.registerLazySingleton<CategoriesRepo>(
          () => CategoriesRepoImp(categoriesRDS:  sl()));
  sl.registerLazySingleton<CategoriesRDS>(
          () => CategoriesRdsImp(client: sl()));

  // Core

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // External
  sl.registerLazySingleton(() => Dio()); // network client
}
