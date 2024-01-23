import 'package:amad_furniture/features/products_screen/data/models/product_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/default_material_button.dart';
import '../../../home_screen/presentation/widgets/my_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 380,
          child:Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://yekacosmetics.in/wp-content/uploads/2022/06/main-1l-hair.jpg"/*product.imageUrl?? ""*/,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) {
                      return Icon(Icons.error);
                    },
                    fit: BoxFit.cover,
                    height: 240,
                    alignment: Alignment.center,
                  ),
                  // Image.asset(
                  //     "assets/images/natural-cosmetics-desk.jpg"),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: CircleAvatar(
                  //       child: Icon(CupertinoIcons.heart)),
                  //   color: ColorManager.myYellow.withOpacity(0.2),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  width: 80,
                  height: 3,
                  decoration: BoxDecoration(color: Color(0xFFFBB710)),
                ),
              ),
              Expanded(
                child: DefaultSelectableText(
                  product.name ?? "الاسم غير متوفر",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: ColorManager.myBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Expanded(
                      child: DefaultSelectableText(
                        (double.parse(product.discount??"1") <= 0 ? "${product.price} ج.م" : "${(double.parse(product.discount??"1") * double.parse(product.price??"1")).toStringAsFixed(2)} ج.م") ?? "",
                        style: TextStyle(
                          color: ColorManager.myBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              double.parse(product.discount??"1") > 0 ? Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: DefaultSelectableText(
                          product.price??"السعر غير متوفر",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.myGrayLite,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ):Container(),
              SizedBox(
                height: 10,
              ),
              DefaultMaterialButton(text: "اضافة الي العربة",onPressed: (){},)
            ],
          ),
        ),
      ),
    )
    ;
  }
}
