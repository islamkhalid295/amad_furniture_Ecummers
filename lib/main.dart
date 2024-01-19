import 'package:amad_furniture/core/api/dio_consummer.dart';
import 'package:amad_furniture/features/Authantication/data/data_sources/Authantication_rds.dart';
import 'package:amad_furniture/features/Authantication/domain/repositories/authantication_repo.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/login_uc.dart';
import 'package:amad_furniture/features/Authantication/presentation/login_screen.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/pages/home_screen.dart';
import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/manager/contact_us_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/home_slider/presentation/manager/slider_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:amad_furniture/core/utils/locator.dart'as di;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/locator.dart';
import 'features/Authantication/presentation/create_account_screen.dart';
import 'features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Almarai',
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.myYellow),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FaqCubit>(
            create: (context) => FaqCubit(sl())..retriveFaq(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (context) => CategoriesCubit(sl())..retriveCategories(),
          ),
          BlocProvider<SliderCubit>(
            create: (context) => SliderCubit(sl())..retriveSliderItems(),
          ),
          BlocProvider<AboutUsCubit>(
            create: (context) => AboutUsCubit(sl())..retriveAboutUs(),
          ),
          BlocProvider<AuthanticationCubit>(
            create: (context) =>/*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/AuthanticationCubit(createAccountUC: CreateAccountUC(authanticationRepo: AuthanticationRepoImp(authanticationRDS: AuthanticationRdsImp(client: DioConsumer(client: Dio())))),loginUC: LoginUC(authanticationRepo: AuthanticationRepoImp(authanticationRDS: AuthanticationRdsImp(client: DioConsumer(client: Dio()))))),
          ),


        ],
        child: Directionality(
          textDirection: TextDirection.rtl,
            child: LoginScreen()),
      ),
    );
  }
}





