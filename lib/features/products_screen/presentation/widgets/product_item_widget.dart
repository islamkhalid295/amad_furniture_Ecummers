import 'package:cedage/core/utils/assets_manager.dart';
import 'package:cedage/core/utils/routes_manager.dart';
import 'package:cedage/features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import 'package:cedage/features/products_screen/data/models/product_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/constantes.dart';
import '../../../../core/utils/my_widget.dart';

class ProductItem extends StatelessWidget {
  bool inCart = false;

   ProductItem({super.key, required this.product});

  final Product product;


  @override
  Widget build(BuildContext context) {
    // CategoriesCubit cubit = BlocProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: (){
          if(product.id != null) {
            context.goNamed(RoutesManager.productScreen,
                pathParameters: {'productId': product.id ?? ""});
            CategoriesCubit.selectedProductID = product.id;
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("تعذر ايجاد المنتج",style: TextStyle(color: ColorManager.myBlack),),
              backgroundColor: ColorManager.myYellow,
            ));
          }
        },
        child: Container(
          height: productItemHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                      /*"https://eaglespiritgourmet.com/wp-content/uploads/2023/12/minimalist-olive-oil-bottle-glass-600x600.webp"*/ product.imageUrl?? "",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                      fit: BoxFit.cover,
                      height: productItemImageHeight,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                  (double.parse(product.discount ?? "0")) > 0 ? Center(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      height: productItemImageHeight + 4,
                      width: 208,
                      child: Image.asset(
                        AssetsManager.saleImage,
                        height: 47.9 * 1.8,
                        width: 60 * 1.8,
                      ),
                    ),
                  ) : Container(),
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
                  decoration: const BoxDecoration(color: Color(0xFFFBB710)),
                ),
              ),
              Expanded(
                child: DefaultSelectableText(
                  product.name ?? "الاسم غير متوفر",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: ColorManager.myBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                ),
              ),
              (product.availableAmount ?? 0) > 0
                  ? Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF06BD4F),
                      shape: OvalBorder(),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  DefaultSelectableText(
                    'متوفر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
                  : Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: Colors.red,
                      shape: OvalBorder(),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  DefaultSelectableText(
                    'غير متوفر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Expanded(
                      child: DefaultSelectableText(
                        (double.parse(product.discount ?? "0") <= 0 ? " ج.م${product.price}" : "${( double.parse(product.price ?? "0") - double.parse(product.discount ?? "0") * double.parse(product.price ?? "0") ).toStringAsFixed(2)} ج.م")
                            ,
                        style: const TextStyle(
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
              ),
              double.parse(product.discount ?? "0") > 0
                  ? Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: DefaultSelectableText(
                          product.price ?? "السعر غير متوفر",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorManager.myGrayLite,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : Container(height: 25),
              const SizedBox(
                height: 10,
              ),
              // BlocProvider(
              //   create: (context) => ProductCubit(),
              //   child: BlocBuilder<ProductCubit, ProductState>(
              //     builder: (context, state) {
              //       ProductCubit cubit = BlocProvider.of(context);
              //
              //       return DefaultMaterialButton(
              //         color: inCart ? ColorManager.myYellow : null,
              //         textColor: inCart ? ColorManager.myBlack : null,
              //         text: inCart ? "تمت الإضافة" : "اضافة الي العربة",
              //         onPressed: () {
              //           if (!inCart) {
              //             cubit.addProductToCart(product);
              //             inCart = !inCart;
              //           } else if (inCart) {
              //             print("remove");
              //             inCart = !inCart;
              //             cubit.removeProductFromCart(product);
              //           }
              //         },
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
