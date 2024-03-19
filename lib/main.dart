

import 'package:cedage/core/api/dio_consummer.dart';
import 'package:cedage/core/utils/color_manager.dart';
import 'package:cedage/core/utils/locator.dart' as di;
import 'package:cedage/core/utils/routes_manager.dart';
import 'package:cedage/features/Authantication/data/data_sources/Authantication_rds.dart';
import 'package:cedage/features/Authantication/domain/repositories/authantication_repo.dart';
import 'package:cedage/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:cedage/features/Authantication/domain/use_cases/forget_password_uc.dart';
import 'package:cedage/features/Authantication/domain/use_cases/get_user_uc.dart';
import 'package:cedage/features/Authantication/domain/use_cases/login_uc.dart';
import 'package:cedage/features/Authantication/domain/use_cases/verify_forget_password_uc.dart';
import 'package:cedage/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:cedage/features/Authantication/presentation/pages/forget_password_screen.dart';
import 'package:cedage/features/Authantication/presentation/pages/login_screen.dart';
import 'package:cedage/features/cart_screen/presentation/cart_screen.dart';
import 'package:cedage/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:cedage/features/cart_screen/presentation/order_screen.dart';
import 'package:cedage/features/home_screen/presentation/manager/basic_data_cubit.dart';
import 'package:cedage/features/home_screen/presentation/pages/home_screen.dart';
import 'package:cedage/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import 'package:cedage/features/home_screen/presentation/widgets/home_slider/presentation/manager/slider_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/locator.dart';
import 'features/Authantication/presentation/pages/create_account_screen.dart';
import 'features/Authantication/presentation/pages/verify_forget_password_screen.dart';
import 'features/cart_screen/presentation/order_summary_screen.dart';
import 'features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_cubit.dart';
import 'features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import 'features/products_screen/presentation/product_screen.dart';
import 'features/products_screen/presentation/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var storage =  FlutterSecureStorageCnsummer(FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true,)));
  AuthanticationCubit.init();

  Bloc.observer = const AppBlocObserver();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesManager.homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<FaqCubit>(
              create: (context) => FaqCubit(sl())..retriveFaq(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (context) => sl<CategoriesCubit>()..retriveCategories(),
            ),
            BlocProvider<SliderCubit>(
              create: (context) => SliderCubit(sl())..retriveSliderItems(),
            ),
            BlocProvider<AboutUsCubit>(
              create: (context) => AboutUsCubit(sl())..retriveAboutUs(),
            ),
            BlocProvider<CartCubit>(
              create: (context) => sl<CartCubit>(),
            ),
            BlocProvider<BasicDataCubit>(
              create: (context) => sl<BasicDataCubit>(),
            ),
            BlocProvider<AuthanticationCubit>(
              create: (context) => AuthanticationCubit(
                  getUserUC: GetUserUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  verifyForgetPasswordUC: VerifyForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  forgetPasswordUC: ForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  createAccountUC: CreateAccountUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  loginUC: LoginUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio()))))),
            ),
          ],
          child: const Directionality(
              textDirection: TextDirection.rtl, child: HomeScreen()),
        ),
      ),
      GoRoute(
        name: RoutesManager.productsScreen,
        path: '${RoutesManager.productsScreen}/:categoryId',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<CategoriesCubit>(),
            ),
            BlocProvider<CartCubit>(
              create: (context) => sl<CartCubit>(),
            ),
            BlocProvider<AuthanticationCubit>(
              create: (context) => AuthanticationCubit(
                  getUserUC: GetUserUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  verifyForgetPasswordUC: VerifyForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  forgetPasswordUC: ForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  createAccountUC: CreateAccountUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  loginUC: LoginUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio()))))),
            ),
          ],
          child:  Directionality(
              textDirection: TextDirection.rtl, child: ProductsScreen(categoryId: state.pathParameters['categoryId']!)),
        ),
      ),
      GoRoute(
        path: RoutesManager.productsScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<CategoriesCubit>(),
            ),
            BlocProvider<CartCubit>(
              create: (context) => sl<CartCubit>(),
            ),
            BlocProvider<AuthanticationCubit>(
              create: (context) => AuthanticationCubit(
                  getUserUC: GetUserUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  verifyForgetPasswordUC: VerifyForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  forgetPasswordUC: ForgetPasswordUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  createAccountUC: CreateAccountUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio())))),
                  loginUC: LoginUC(
                      authanticationRepo: AuthanticationRepoImp(
                          authanticationRDS: AuthanticationRdsImp(
                              client: DioConsumer(client: Dio()))))),
            ),
          ],
          child:  Directionality(
              textDirection: TextDirection.rtl, child: ProductsScreen(categoryId: null,)),
        ),
      ),
      GoRoute(
        name: RoutesManager.productScreen,
        path: '${RoutesManager.productScreen}/:productId',
        builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<CartCubit>(),
              ),
              BlocProvider(
                create: (context) => CategoriesCubit(
                    sl()) /*..getProduct(CategoriesCubit.selectedProductID ?? "")*/,
              ),
              BlocProvider<AuthanticationCubit>(
                create: (context) => AuthanticationCubit(
                    getUserUC: GetUserUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    verifyForgetPasswordUC: VerifyForgetPasswordUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    forgetPasswordUC: ForgetPasswordUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    createAccountUC: CreateAccountUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    loginUC: LoginUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio()))))),
              ),
            ],
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ProductScreen(
                    productId: state.pathParameters['productId']!))),
      ),
      GoRoute(
        name: RoutesManager.orderSummaryScreen,
        path: '${RoutesManager.orderSummaryScreen}/:name/:phone/:anotherPhone/:email/:landmark/:address/:delivery/:city',
        builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<CartCubit>(),
              ),
              BlocProvider(
                create: (context) => CategoriesCubit(
                    sl()) /*..getProduct(CategoriesCubit.selectedProductID ?? "")*/,
              ),
              BlocProvider<AuthanticationCubit>(
                create: (context) => AuthanticationCubit(
                    getUserUC: GetUserUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    verifyForgetPasswordUC: VerifyForgetPasswordUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    forgetPasswordUC: ForgetPasswordUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    createAccountUC: CreateAccountUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio())))),
                    loginUC: LoginUC(
                        authanticationRepo: AuthanticationRepoImp(
                            authanticationRDS: AuthanticationRdsImp(
                                client: DioConsumer(client: Dio()))))),
              ),
            ],
            child: Directionality(
                textDirection: TextDirection.rtl,
                child:  OrderSummaryScreen(
                    name: state.pathParameters['name']!,
                  // secondName: state.pathParameters['secondName']!,
                  phone: state.pathParameters['phone']!,
                  anotherPhone: state.pathParameters['anotherPhone']!,
                  email: state.pathParameters['email']!,
                  landmark: state.pathParameters['landmark']!,
                  address: state.pathParameters['address']!,
                  delivery: state.pathParameters['delivery']!,
                  city: state.pathParameters['city']!,
                ))),
      ),
      GoRoute(
        path: RoutesManager.cartScreen,
        builder: (context, state) => MultiBlocProvider(
            providers: [
              ///TODO
              BlocProvider(
                create:
                    (context) => /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/
                        AuthanticationCubit(
                            getUserUC: GetUserUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            verifyForgetPasswordUC: VerifyForgetPasswordUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            forgetPasswordUC: ForgetPasswordUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            createAccountUC: CreateAccountUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            loginUC: LoginUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio()))))),
              ),
              BlocProvider(
                create: (context) => sl<CartCubit>(),
              ),
            ],
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Directionality(
                    textDirection: TextDirection.rtl, child: CartScreen()))),
      ),
      GoRoute(
        path: RoutesManager.orderScreen,
        builder: (context, state) => MultiBlocProvider(
            providers: [
              ///TODO
              BlocProvider(
                create: (context) => /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/AuthanticationCubit(
                            getUserUC: GetUserUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            verifyForgetPasswordUC: VerifyForgetPasswordUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            forgetPasswordUC: ForgetPasswordUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            createAccountUC: CreateAccountUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio())))),
                            loginUC: LoginUC(
                                authanticationRepo: AuthanticationRepoImp(
                                    authanticationRDS: AuthanticationRdsImp(
                                        client: DioConsumer(client: Dio()))))),
              ),
              BlocProvider(
                create: (context) => sl<CartCubit>(),
              ),
            ],
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Directionality(
                    textDirection: TextDirection.rtl, child: OrderScreen()))),
      ),
      GoRoute(
        path: RoutesManager.createAccountScreen,
        builder: (context, state) => BlocProvider(
          create:
              (context) => /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/
                  AuthanticationCubit(
                      getUserUC: GetUserUC(
                          authanticationRepo: AuthanticationRepoImp(
                              authanticationRDS: AuthanticationRdsImp(
                                  client: DioConsumer(client: Dio())))),
                      verifyForgetPasswordUC: VerifyForgetPasswordUC(
                          authanticationRepo: AuthanticationRepoImp(
                              authanticationRDS: AuthanticationRdsImp(
                                  client: DioConsumer(client: Dio())))),
                      forgetPasswordUC: ForgetPasswordUC(
                          authanticationRepo: AuthanticationRepoImp(
                              authanticationRDS: AuthanticationRdsImp(
                                  client: DioConsumer(client: Dio())))),
                      createAccountUC: CreateAccountUC(
                          authanticationRepo: AuthanticationRepoImp(
                              authanticationRDS: AuthanticationRdsImp(
                                  client: DioConsumer(client: Dio())))),
                      loginUC: LoginUC(
                          authanticationRepo: AuthanticationRepoImp(
                              authanticationRDS: AuthanticationRdsImp(
                                  client: DioConsumer(client: Dio()))))),
          child: const Directionality(
              textDirection: TextDirection.rtl, child: CreateAccountScreen()),
        ),
      ),
      GoRoute(
        path: RoutesManager.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthanticationCubit(
              getUserUC: GetUserUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              verifyForgetPasswordUC: VerifyForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              forgetPasswordUC: ForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              createAccountUC: CreateAccountUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              loginUC: LoginUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(
                              client:
                                  Dio()))))) /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/,
          child: const Directionality(
              textDirection: TextDirection.rtl, child: LoginScreen()),
        ),
      ),
      GoRoute(
        path: RoutesManager
            .forgetPasswordScreen /*'/authentication/forget_password'*/,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthanticationCubit(
              getUserUC: GetUserUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              verifyForgetPasswordUC: VerifyForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              forgetPasswordUC: ForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              createAccountUC: CreateAccountUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              loginUC: LoginUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(
                              client:
                                  Dio()))))) /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/,
          child: const Directionality(
              textDirection: TextDirection.rtl, child: ForgetPasswordScreen()),
        ),
      ),
      GoRoute(
        path: RoutesManager
            .verifyForgetPasswordScreen /*'/authentication/forget_password'*/,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthanticationCubit(
              getUserUC: GetUserUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              verifyForgetPasswordUC: VerifyForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              forgetPasswordUC: ForgetPasswordUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              createAccountUC: CreateAccountUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(client: Dio())))),
              loginUC: LoginUC(
                  authanticationRepo: AuthanticationRepoImp(
                      authanticationRDS: AuthanticationRdsImp(
                          client: DioConsumer(
                              client:
                                  Dio()))))) /*AuthanticationCubit(loginUC: LoginUC(authanticationRepo: sl()),createAccountUC: CreateAccountUC (authanticationRepo:sl()))*/,
          child: const Directionality(
              textDirection: TextDirection.rtl,
              child: VerifyForgetPasswordScreen()),
        ),
      ),
      // ... other routes
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Cedage',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Almarai',
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.myYellow),
        useMaterial3: true,
      ),
    );
  }
}
