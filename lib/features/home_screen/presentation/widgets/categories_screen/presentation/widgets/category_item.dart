import 'package:amad_furniture/core/utils/constantes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/color_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.height, required this.name, required this.imageUrl});
final double height;
final String name;
final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) {
            return Icon(Icons.error);
          },
          fit: BoxFit.cover,
          height: height,
          width: 250,
        ),
        Container(
          width: 80,
          height: 3,
          decoration: BoxDecoration(color: Color(0xFFFBB710)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,right: 10),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.myYellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.myBlack,
                  fontSize: 14,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,

                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
