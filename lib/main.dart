import 'package:amad_furniture/presentation/home_screen.dart';
import 'package:amad_furniture/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: HomeScreen(),
    );
  }
}





