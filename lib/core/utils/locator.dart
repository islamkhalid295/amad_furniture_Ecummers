import 'package:amad_furniture/core/storage/flutter_secure_storage.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/forget_password_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/get_user_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/verify_forget_password_uc.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/domain/use_cases/about_us_uc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';


import '../../features/Authantication/data/data_sources/Authantication_rds.dart';
import '../../features/Authantication/domain/repositories/Authantication_repo.dart';
import '../../features/Authantication/domain/use_cases/login_uc.dart';
import '../../features/Authantication/presentation/manager/authantication_cubit.dart';
import '../../features/cart_screen/data/data_sources/Cart_rds.dart';
import '../../features/cart_screen/domain/repositories/cart_repo.dart';
import '../../features/cart_screen/presentation/manager/cart_cubit.dart';
import '../../features/home_screen/presentation/widgets/FAQ_screen/data/data_sources/faq_rds.dart';
import '../../features/home_screen/presentation/widgets/FAQ_screen/domain/repositories/faq_repo.dart';
import '../../features/home_screen/presentation/widgets/FAQ_screen/domain/use_cases/retrive_faq_uc.dart';
import '../../features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_cubit.dart';
import '../../features/home_screen/presentation/widgets/about_us_screen/data/data_sources/about_us_rds.dart';
import '../../features/home_screen/presentation/widgets/about_us_screen/domain/repositories/about_us_repo.dart';
import '../../features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/data/data_sources/categories_rds.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/domain/repositories/categories_repo.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/domain/use_cases/retrive_categories_uc.dart';
import '../../features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';

import '../../features/home_screen/presentation/widgets/contact_us_screen/data/data_sources/contact_us_rds.dart';
import '../../features/home_screen/presentation/widgets/contact_us_screen/domain/repositories/contact_us_repo.dart';
import '../../features/home_screen/presentation/widgets/contact_us_screen/domain/use_cases/send_contact_info_uc.dart';
import '../../features/home_screen/presentation/widgets/contact_us_screen/presentation/manager/contact_us_cubit.dart';
import '../../features/home_screen/presentation/widgets/home_slider/data/remote/data_sources/slider_rds.dart';
import '../../features/home_screen/presentation/widgets/home_slider/domain/repositories/slider_repo.dart';
import '../../features/home_screen/presentation/widgets/home_slider/domain/use_cases/retrive_slider_items_uc.dart';
import '../../features/home_screen/presentation/widgets/home_slider/presentation/manager/slider_cubit.dart';
import '../api/api_consummer.dart';
import '../api/dio_consummer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  // Features - Authantication
  sl.registerFactory(() => AuthanticationCubit(verifyForgetPasswordUC: sl(),createAccountUC: sl(),loginUC: sl(),forgetPasswordUC: sl(),getUserUC: sl()));
  sl.registerLazySingleton(() => CreateAccountUC(authanticationRepo: sl()));
  sl.registerLazySingleton(() => LoginUC(authanticationRepo: sl()));
  sl.registerLazySingleton(() => GetUserUC(authanticationRepo: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUC(authanticationRepo: sl()));
  sl.registerLazySingleton(() => VerifyForgetPasswordUC(authanticationRepo: sl()));
  sl.registerLazySingleton<AuthanticationRepo>(
          () => AuthanticationRepoImp(authanticationRDS: sl()));
  sl.registerLazySingleton<AuthanticationRDS>(
          () => AuthanticationRdsImp(client: sl()));

  // Features - Slider

  sl.registerFactory(() => SliderCubit(sl()));
  sl.registerLazySingleton(() => RetriveSliderItemsUC(sliderRepo: sl()));
  sl.registerLazySingleton<SliderRepo>(
          () => SliderRepoImp(sliderRDS:  sl()));
  sl.registerLazySingleton<SliderRDS>(
          () => SliderRdsImp(client: sl()));


  // Features - Categories
  sl.registerFactory(() => CategoriesCubit( sl()));
  // sl.registerLazySingleton(() => RetriveCategoriesUC(sl()));
  sl.registerLazySingleton<CategoriesRepo>(
          () => CategoriesRepoImp(categoriesRDS:  sl()));
  sl.registerLazySingleton<CategoriesRDS>(
          () => CategoriesRdsImp(client: sl()));


  // Features - Faq
  sl.registerFactory(() => FaqCubit(sl()));
  sl.registerLazySingleton(() => RetriveFaqUC(faqRepo:  sl()));
  sl.registerLazySingleton<FaqRepo>(
          () => FaqRepoImp(faqRDS:   sl()));
  sl.registerLazySingleton<FaqRDS>(
          () => FaqRdsImp(client: sl()));

  // Features - ContactUs
  sl.registerFactory(() => ContactUsCubit(sl()));
  sl.registerLazySingleton(() => SendContactUsUC(contactUsRepo: sl()));
  sl.registerLazySingleton<ContactUsRepo>(
          () => ContactUsRepoImp(contactUsRDS:   sl()));
  sl.registerLazySingleton<ContactUsRDS>(
          () => ContactUsRdsImp(client: sl()));

  // Features - AboutUs
  sl.registerFactory(() => AboutUsCubit(sl()));
  sl.registerLazySingleton(() => RetriveAboutUsUC(aboutUsRepo: sl()));
  sl.registerLazySingleton<AboutUsRepo>(
          () => AboutUsRepoImp(aboutUsRDS: sl()));
  sl.registerLazySingleton<AboutUsRDS>(
          () => AboutUsRdsImp(client: sl()));

  // Features - Cart
  sl.registerFactory(() => CartCubit(sl()));
  // sl.registerLazySingleton(() => RetriveCartUC(aboutUsRepo: sl()));
  sl.registerLazySingleton<CartRepo>(
          () => CartRepoImp(cartRDS:  sl()));
  sl.registerLazySingleton<CartRDS>(
          () => CartRdsImp(client: sl()));


  // sl.registerFactory(() => AuthanticationCubit(sl()));
  // sl.registerLazySingleton(() => CreateAccountUC(authanticationRepo: sl()));
  // sl.registerLazySingleton<AuthanticationRepo>(
  //         () => AuthanticationRepoImp(authanticationRDS:  sl()));
  // sl.registerLazySingleton<AuthanticationRDS>(
  //         () => AuthanticationRdsImp(client: sl()));
  // Core

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // External
  sl.registerLazySingleton(() => Dio()); // network client
}
