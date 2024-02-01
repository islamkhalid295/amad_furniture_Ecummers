import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/cart_screen/data/models/cart_model.dart';
import 'package:amad_furniture/features/cart_screen/data/models/product_amount_model.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/categories_screen/presentation/manager/categories_screen_cubit.dart';
import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../../core/utils/routes_manager.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../../cart_screen/presentation/manager/cart_cubit.dart';

class ProductScreen extends StatelessWidget {
  // bool inCart = CartCubit.cart?.contains(CategoriesCubit.productInfo) ?? false;

TextEditingController amountController = TextEditingController(text: "1");
String productId;
late bool inCart ;

  // List<String> arrayImages = const [
  //   "https://i.ibb.co/ZLFHX3F/1.png",
  //   "https://i.ibb.co/JKJvs5S/2.png",
  //   "https://i.ibb.co/LCzV7b3/3.png",
  //   "https://i.ibb.co/L8JHn1L/4.png",
  //   "https://i.ibb.co/7RWNCXH/5.png",
  //   "https://i.ibb.co/bBsh5Pm/6.png",
  // ];
  List<String> arrayImages =
      List<String>.from(CategoriesCubit.productInfo?.imageUrls ??
          [
            "https://i.ibb.co/ZLFHX3F/1.png",
            "https://i.ibb.co/JKJvs5S/2.png",
            "https://i.ibb.co/LCzV7b3/3.png",
            "https://i.ibb.co/L8JHn1L/4.png",
            "https://i.ibb.co/7RWNCXH/5.png",
            "https://i.ibb.co/bBsh5Pm/6.png",
          ]);

  ProductScreen({required this.productId,super.key});

  // final Product CategoriesCubit.productInfo = Product(
  //     id: "1",
  //     name: "name",
  //     imageUrl: "",
  //     price: "1251",
  //     discount: "0.5",
  //     availableAmount: 11);

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    CategoriesCubit categoriesCubit = BlocProvider.of(context);
    CartCubit cartCubit = BlocProvider.of(context);
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (CartCubit.cart == null) {
      cartCubit.getCart();
    }
    categoriesCubit.getProduct(productId);
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return CategoriesCubit.productInfo == null ||
                    state is GetProductLoading
                ? Center(
                    child: state is GetProductError
                        ? AlertDialog(
                            title: const Text('خطأ'),
                            content:
                                const Text('لا يمكن عرض هذا المنتج في الوقت الحالي'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    context.go(RoutesManager.productsScreen),
                                child: const Text('العودة'),
                              ),
                            ],
                          )
                        : const CircularProgressIndicator())
                : Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  width: 80,
                                  height: 3,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFBB710)),
                                ),
                              ),
                              DefaultSelectableText(
                                CategoriesCubit.productInfo?.name ?? "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Expanded(
                                        child: DefaultSelectableText(
                                          (double.parse(CategoriesCubit
                                                              .productInfo
                                                              ?.discount ??
                                                          "0") <=
                                                      0
                                                  ? "ج.م" +
                                                      "${CategoriesCubit.productInfo?.price}"
                                                  : "${(double.parse(CategoriesCubit.productInfo?.price ?? "0") - double.parse(CategoriesCubit.productInfo?.discount ?? "0") * double.parse(CategoriesCubit.productInfo?.price ?? "0")).toStringAsFixed(2)} ج.م"),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 26,
                                            fontFamily: 'Almarai',
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    double.parse(CategoriesCubit
                                                    .productInfo?.discount ??
                                                "1") >
                                            0
                                        ? const DefaultSelectableText(
                                            "-",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        : Container(),
                                    double.parse(CategoriesCubit
                                                    .productInfo?.discount ??
                                                "1") >
                                            0
                                        ? Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    child:
                                                        DefaultSelectableText(
                                                      "${CategoriesCubit.productInfo?.price} ج.م",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Almarai',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              (CategoriesCubit.productInfo?.availableAmount ?? 0) > 0
                                  ? Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF06BD4F),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: DefaultSelectableText(
                                            'متوفر',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const ShapeDecoration(
                                            color: Colors.red,
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: DefaultSelectableText(
                                            'غير متوفر',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                              (CategoriesCubit.productInfo?.availableAmount ?? 0) > 0 ? Row(
                                children: [
                                  const DefaultSelectableText(
                                    'الكميه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.38,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  DefaultTextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: amountController,
                                    width: 60,
                                    textAlign: TextAlign.center,
                                    paddingRight: 0,

                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      CartCubit cartCubit =
                                          BlocProvider.of(context);
                                      inCart = CartCubit.cartModel?.cart?.products?.contains(Products(id: productId)) ?? false;
                                      // inCart = CartCubit.cart?.contains(CategoriesCubit.productInfo) ?? false;
                                      return Column(
                                        children: [
                                          state is AddAmountOfProductToCartError ? Text(state.error,style: const TextStyle(color: Colors.red),):const SizedBox(),
                                          DefaultMaterialButton(
                                            minWidth: 300 * MediaQuery.of(context).size.width / 1400,
                                            borderRadius: 10,
                                            color: inCart ? ColorManager.myYellow : null,
                                            textColor: inCart ? ColorManager.myBlack : null,
                                            text: token == "null" ? "تسجيل الدخول اولا" : inCart ? "تمت الإضافة" : "اضافة الي العربة",
                                            onPressed: () {
                                               if (token != "null"){
                                                      if (!inCart) {
                                                        cartCubit.addAmountOfProductToCart(
                                                            productAmountModel: ProductAmountModel(
                                                                id: CategoriesCubit.productInfo!.id,
                                                                amount: int.parse(amountController.text)));
                                                        print(CartCubit.cart?.length);

                                                        // inCart = !inCart;
                                                      } else if (inCart) {
                                                        print("remove");
                                                        // inCart = !inCart;
                                                        cartCubit.deleteAmountOfProductFromCart(
                                                            productAmountModel: ProductAmountModel(
                                                                id: CategoriesCubit.productInfo!.id,
                                                                amount: int.parse(amountController.text)));
                                                      }
                                                    } else context.go(RoutesManager.loginScreen);
                                                  },
                                            lodingCondition: state is AddAmountOfProductToCartLoading || state is DeleteAmountOfProductToCartLoading || state is GetCartLoading,
                                            errorCondition: state is AddAmountOfProductToCartError || state is DeleteAmountOfProductToCartError || state is GetCartLoading,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ) : const SizedBox(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35),
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Colors.black
                                            .withOpacity(0.3199999928474426),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                child: ListView(
                                  children: CategoriesCubit
                                      .productInfo!.wholesaleOffers!
                                      .map((e) => DefaultSelectableText(
                                            e,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                  0.6000000238418579),
                                              fontSize: 14,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35),
                                child: Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Colors.black
                                            .withOpacity(0.3199999928474426),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                child: Text(
                                  'هو عبارة عن دهن سائل غني بالأحماض الدهنية الأحادية غير المشبعة التي تمنحنا فوائد زيت الزيتون المتنوعة، ويتم استخلاصه من ثمرة الزيتون، حيث يتم الحصول على الزيت عن طريق عصرالزيتون الكامل. ويختلف تكوين زيت الزيتون باختلاف صنف الزيتون الذي يتم استخلاصه ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 650,
                          height: 600,
                          child: flexiProductimageSlider(
                            //required fields
                            arrayImages: List<String>.from(
                                CategoriesCubit.productInfo?.imageUrls ?? []),
                            // optional fields
                            //set where you want to set your thumbnail
                            sliderStyle: SliderStyle.overSlider,
                            //.nextToSlider
                            // set you slider height like 1.0,1.5,2.0 etc...
                            aspectRatio: 0.8,
                            //set content mode of image
                            boxFit: BoxFit.cover,
                            //set this if you want to set any default image index when it loads
                            selectedImagePosition: 0,
                            //set your thumbnail alignment in slider
                            thumbnailAlignment: ThumbnailAlignment.bottom,
                            //.right , .bottom
                            thumbnailBorderType: ThumbnailBorderType.all,
                            //.bottom, .all
                            thumbnailBorderWidth: 1.5,
                            //double value

                            //set corner radius of your thumbnail
                            thumbnailBorderRadius: 2,

                            //set your thumbnail height & width
                            //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
                            thumbnailWidth: 55,
                            thumbnailHeight: 55,

                            //set color of current image thumbnail border
                            thumbnailBorderColor: Colors.blue,

                            //make you action when user click on image
                            onTap: (index) {
                              print("selected index : $index");

                              //for zooming effect on click
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => galleryZoomSlides(
                                            //required fields
                                            arrayImages: List<String>.from(
                                                CategoriesCubit.productInfo
                                                        ?.imageUrls ??
                                                    []),

                                            //Optional fields
                                            zoomTheme: ZoomTheme.theme3,
                                            //.theme1, .theme2, .theme3
                                            selectedImagePosition: index,
                                            selectedThumbnailColor: Colors.blue,
                                          )));
                            },
                          ),
                        ), /*Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                // CarouselSlider(
                //   // carouselController: SliderCubit.carouselController,
                //   options: CarouselOptions(
                //     height: 650 * MediaQuery.of(context).size.height /1024,
                //     enlargeCenterPage: true,
                //     viewportFraction: 1,
                //     autoPlay: true,
                //   ),
                //   items: /*SliderCubit.sliderItemsList?.slider?*/
                //   [1, 2, 3, 4, 5, 6, 7, 8].map((sliderItem) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return Image.asset(
                //             "assets/images/minimalist-olive-oil-bottle-glass.jpg",
                //         fit: BoxFit.cover,
                //         );
                //       },
                //     );
                //   }).toList(),
                // ),
                // SingleChildScrollView(
                //   child: Container(
                //     height: 100, // Adjust the height as needed
                //     width: 500,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 10,
                //       itemBuilder: (context, index) => Image.asset(
                //         "assets/images/minimalist-olive-oil-bottle-glass.jpg",
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                              ],
                            ),*/
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
