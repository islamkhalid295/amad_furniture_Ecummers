import 'package:amad_furniture/core/utils/constantes.dart';
import 'package:amad_furniture/features/home_screen/domain/repositories/basic_page_data_repo.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/about_us_screen.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/categories_screen/presentation/pages/catrgories_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../widgets/FAQ_screen/presentation/pages/faq_screen.dart';
import '../widgets/contact_us_screen/presentation/contact_us_screen.dart';
import '../widgets/home_slider/presentation/widgets/slider.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  late TabController tabController;

  static  int sectionsNumber = homeScreenSections.length;

  static final bool isLogedIn = token != null; // make it true
  static final String userName = "إسلام خالد";

  static List<Widget> homeScreenSections = [
    HomeSlider(),
    CategoriesScreen(),
    FaqScreen(),
    ContactUsScreen(),
    AboutUsScreen(),
    // AboutUsScreen(),
    // AboutUsScreen(),
  ];
  static const List<Tab> tabBarTabs = [
    Tab(
      text: "رئيسية",
    ),
    Tab(
      text: "من نحن",

    ),
    Tab(
      text: "تسوق",
    ),
    Tab(

      text: "الأسئلة الشائعة",
    ),
    Tab(

      text: "تواصل معنا",
    ),

  ];

}
