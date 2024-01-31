import 'package:flutter/material.dart';

import '../../features/home_screen/presentation/widgets/categories_screen/data/models/categories_model.dart';

const double yellowBannarHeight = 40;
const double tabBarHeight = 72;
const int verificationCodeLength = 6;
const double productItemHeight = 340;
const double productItemImageHeight = productItemHeight - 140;
const double cartProductImageSize = 100;
String? token;




double getSectionHeight (context) => MediaQuery.of(context).size.height-yellowBannarHeight-tabBarHeight;

Map<String,dynamic> categoriesJson ={
  "categories": [
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    },
    {
      "name": "string - id",
      "image_url": "https://vitacare.com.bd/wp-content/uploads/2023/04/Olive-Oil-exta-1.jpg",
      "subcategories": [
        "String - Each Subcategory name",
        "String - Each Subcategory name",
        "String - Each Subcategory name"
      ]
    }
  ]
};
CategoriesList categoriesList = CategoriesList.fromJson(categoriesJson); // max length = 13