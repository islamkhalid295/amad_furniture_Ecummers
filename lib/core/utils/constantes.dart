import 'package:flutter/material.dart';

const double yellowBannarHeight = 40;
const double tabBarHeight = 72;

const int sectionsNumber = 3;




double getSectionHeight (context) => MediaQuery.of(context).size.height-yellowBannarHeight-tabBarHeight;