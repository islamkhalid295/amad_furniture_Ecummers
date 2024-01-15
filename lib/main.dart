import 'package:amad_furniture/features/home_screen/presentation/pages/home_screen.dart';
import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/manager/contact_us_cubit.dart';
import 'package:flutter/material.dart';

import 'package:amad_furniture/core/utils/locator.dart'as di;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/locator.dart';



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


        ],
        child: HomeScreen(),
      ),
    );
  }
}





