import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/my_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.height, required this.name, required this.imageUrl, this.onTap});
final double height;
final String name;
final String imageUrl;
final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CachedNetworkImage(
            width:  200,
            imageUrl: imageUrl,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) {
              return Icon(Icons.error);
            },
            fit: BoxFit.cover,
            height: height,

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
                child: DefaultSelectableText(
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
      ),
    );
  }
}
