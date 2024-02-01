import 'package:amad_furniture/core/utils/assets_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/features/cart_screen/data/models/cart_model.dart';
import 'package:amad_furniture/features/cart_screen/data/models/product_amount_model.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home_screen/presentation/widgets/home_slider/domain/models/slider_item_model.dart';
import '../../features/home_screen/presentation/widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../../features/home_screen/presentation/widgets/navigation_bar/presentation/shop_cart_icon.dart';
import '../widgets/default_material_button.dart';
import 'color_manager.dart';

import 'constantes.dart';

class OrderTextFormField extends StatelessWidget {
  const OrderTextFormField(
      {super.key, this.hintText, this.width, this.validator, this.controller});

  final String? hintText;
  final double? width;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: width ?? 300,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(right: 20),
            label: hintText != null ? Text(hintText!) : null,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: ColorManager.myGray)
            ),
          ),
        ),
      ),
    );
  }
}


class CartProductItem extends StatelessWidget {
  CartProductItem(
      {required this.product, super.key, required this.amountController,});

  final Products product;
  final TextEditingController amountController;


  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of(context);
    return InkWell(
      onTap: () {
        context.goNamed(RoutesManager.productScreen,
            pathParameters: {'productId': product.id ?? ""});
        // CategoriesCubit.selectedProductID = product.id;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(child: Image.asset(
              "assets/images/minimalist-olive-oil-bottle-glass.jpg",
              height: cartProductImageSize, width: cartProductImageSize,)),
            Expanded(
              child: DefaultSelectableText(
                product.name ?? "الاسم غير متوفر",
                style: const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultSelectableText(
                  ((product.discount ?? 0) <= 0 ? "ج.م" "${product.price}"
                      : "${(double.parse(product.price ?? "0") -
                      (product.discount)! * double.parse(product.price ?? "0"))
                      .toStringAsFixed(2)} ج.م"),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 16,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
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
                    width: 8,
                  ),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            color: ColorManager.myOffWhite,
                            child: TextFormField(
                              controller: amountController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  fillColor: ColorManager.myOffWhite,
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          DefaultMaterialButton(
                            lodingCondition: state is AddAmountOfProductToCartLoading ||
                                state is DeleteAmountOfProductToCartLoading,
                            succsessCondition: state is AddAmountOfProductToCartSuccess ||
                                state is DeleteAmountOfProductToCartSuccess,
                            errorCondition: state is AddAmountOfProductToCartError ||
                                state is DeleteAmountOfProductToCartError,
                            onPressed: () {
                              if ((int.parse(amountController.text) -
                                  (product.amount)!) > 0) {
                                cartCubit.addAmountOfProductToCart(
                                    productAmountModel: ProductAmountModel(
                                        id: product.id,
                                        amount: int.parse(
                                            amountController.text) -
                                            (product.amount)!));
                              } else if ((int.parse(amountController.text) -
                                  (product.amount)!) < 0) {
                                cartCubit.deleteAmountOfProductFromCart(
                                    productAmountModel: ProductAmountModel(
                                        id: product.id,
                                        amount: (product.amount)! -
                                            int.parse(
                                                amountController.text)));
                              }
                            },
                            height: 20,
                            fontSize: 15,
                            text: "تحديث",
                            minWidth: 80 * MediaQuery.of(context).size.width / 1440,
                            borderRadius: 0,
                          ),
                        ],
                      );
                    },
                  ),

                  // DefaultTextFormField(
                  //
                  //   controller: amountController,
                  //   width: 60,
                  //   textAlign: TextAlign.center,
                  //   paddingRight: 0,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Container(
                height: cartProductImageSize,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black.withOpacity(0.3199999928474426),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultSelectableText(
                  product.totalPrice!.toStringAsFixed(2),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 16,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }
}

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {


  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      toolbarHeight: tabBarHeight,
      backgroundColor: ColorManager.myWhite,
      leading: Padding(
        padding: EdgeInsets.only(
            right: (90 * MediaQuery
                .of(context)
                .size
                .width / 1235)),
        child: Image.asset("assets/icons/Link → logo.png.png"),
      ),
      leadingWidth: MediaQuery
          .of(context)
          .size
          .width < 800
          ? 200 * MediaQuery
          .of(context)
          .size
          .width / 800
          : 200,
      title: DefaultTextButton(
          onPressed: () {
            context.go(RoutesManager.homeScreen);
          },
          title: "الرئيسية"),
      titleSpacing: 100,
      actions: [
        SizedBox(
          width: 30 * MediaQuery
              .of(context)
              .size
              .width / 1440,
        ),
        const ShopCart(),
        SizedBox(
          width: 30 * MediaQuery
              .of(context)
              .size
              .width / 1440,
        ),
        const NavigationBarSignInButton(),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, tabBarHeight);
}

class DefaultSelectableText extends StatelessWidget {
  const DefaultSelectableText(this.text,
      {super.key, this.style, this.textAlign, this.maxLines, this.onTap,});

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      onTap: onTap,
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.myYellow),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: onPressed,
          child: FittedBox(
            child: Text(title, style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Almarai',
              fontWeight: FontWeight.w700,
            ),),
          )),
    );
  }
}

class DefaultTextFormField extends StatelessWidget {

  const DefaultTextFormField(
      {super.key, this.title, this.hintText, this.icon, this.suffixIcon, this.maxLines, this.width, this.height, this.boxShape, this.validator, this.controller, this.obscureText, this.textAlign = TextAlign
          .start, this.paddingRight = 10.0, this.keyboardType, this.onFieldSubmitted, this.backgroundColor});

  final String? title;
  final String? hintText;
  final Icon? icon;
  final Widget? suffixIcon;
  final int? maxLines;
  final double? width;
  final double? height;
  final BoxShape? boxShape;
  final bool? obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final double paddingRight;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: width ?? 300,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorManager.myWhite,
          border: Border.all(color: ColorManager.myGrayLiteMore,),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: paddingRight),
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            textAlign: textAlign,
            obscureText: obscureText ?? false,
            controller: controller,
            validator: validator /*(value) {
              if (value!.isEmpty) {
                return 'name can\'t be empty';
              } else {
                return null;
              }
            }*/,
            decoration: InputDecoration(
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              hintStyle: const TextStyle(
                  fontSize: 14, color: ColorManager.myGray),
              border: InputBorder.none,
              hintText: title,

              suffixIcon: suffixIcon,
            ),
            maxLines: maxLines,
          ),
        ),
      ),
    );
  }
}


Widget mySlider(context, SliderItem sliderItem) =>
    Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/images/home_background.jpeg", fit: BoxFit.cover,),
        // CachedNetworkImage(
        //   imageUrl: sliderItem.imageUrl ?? "",
        //   placeholder: (context, url) =>
        //       Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) {
        //     print(error.toString());
        //     //return Icon(Icons.error);
        //     return CachedNetworkImage(
        //       imageUrl: SliderCubit.imageOnErrorLodingImage ?? "",
        //       placeholder: (context, url) =>
        //           Center(child: CircularProgressIndicator()),
        //       errorWidget: (context, url, error) {
        //         print(error.toString());
        //         return Icon(Icons.error);
        //       },
        //       fit: BoxFit.cover,
        //     );
        //   },
        //   fit: BoxFit.cover,
        // ),
        Padding(
          padding: EdgeInsets.only(
              top: 255, right: 140 * MediaQuery
              .of(context)
              .size
              .width / 1440),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultSelectableText(
                sliderItem.title ?? "",
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 44,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width < 400
                        ? 320 * MediaQuery
                        .of(context)
                        .size
                        .width / 400
                        : 320,
                    child: DefaultSelectableText(
                      sliderItem.description ?? "",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8999999761581421),
                        fontSize: 16,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {
                  context.go(RoutesManager.productsScreen);
                },
                color: ColorManager.myBlack,
                minWidth: 210,
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: ColorManager.myBlack, style: BorderStyle.solid)),
                child: const Text(
                  'تسوق الان',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.59,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget aboutUs(context) =>
    Container(
      height: 320,
      decoration: const ShapeDecoration(
        color: ColorManager.myWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: ColorManager.myGrayLite),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
        child: MediaQuery
            .of(context)
            .size
            .width > 1000
            ? Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultSelectableText(
                  'اتصل بنا',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultSelectableText(
                  'البريد الالكتروني',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DefaultSelectableText(
                  'Amad furniture1@gmail.com',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DefaultSelectableText(
                  'رقم الجوال',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DefaultSelectableText(
                  '(+966) 8989 7878',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DefaultSelectableText(
                  'العنوان ',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DefaultSelectableText(
                  'القاهره , مدينه نصر',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DefaultSelectableText(
                  'تواصل معانا',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width < 1010
                          ? 436 * MediaQuery
                          .of(context)
                          .size
                          .width / 1010
                          : 436,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF959595),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          // textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            hintText: "ادخل البريد الالكتروني",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.27000001072883606),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: ColorManager.myBlack,
                      minWidth: 140,
                      height: 55,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(
                              color: ColorManager.myBlack,
                              style: BorderStyle.solid)),
                      child: const DefaultSelectableText(
                        'ارسال',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.59,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 68,
                  width: 164,
                  child: Image.asset(
                    AssetsManager.camponyLogo,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Image.asset(
                        "assets/icons/youtube-removebg-preview.jpg",
                        height: 24,
                        width: 24),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset(
                        "assets/icons/instagram-removebg-preview.jpg",
                        height: 24,
                        width: 24),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset(
                        "assets/icons/twitter-removebg-preview.jpg",
                        height: 24,
                        width: 24),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset(
                        "assets/icons/facebook__1_-removebg-preview.jpg",
                        height: 24,
                        width: 24),
                  ],
                ),
              ],
            ),
          ],
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultSelectableText(
                    'اتصل بنا',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DefaultSelectableText(
                    'البريد الالكتروني',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const DefaultSelectableText(
                    'Amad furniture1@gmail.com',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DefaultSelectableText(
                    'رقم الجوال',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const DefaultSelectableText(
                    '(+966) 8989 7878',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DefaultSelectableText(
                    'العنوان ',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const DefaultSelectableText(
                    'القاهره , مدينه نصر',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const DefaultSelectableText(
                    'تواصل معانا',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width < 1010
                            ? 436 *
                            MediaQuery
                                .of(context)
                                .size
                                .width /
                            1010
                            : 436,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFF959595),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            // textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              hintText: "ادخل البريد الالكتروني",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.27000001072883606),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: ColorManager.myBlack,
                        minWidth: 140,
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(
                                color: ColorManager.myBlack,
                                style: BorderStyle.solid)),
                        child: const DefaultSelectableText(
                          'ارسال',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.59,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 68,
                    width: 164,
                    child: Image.asset(
                      AssetsManager.camponyLogo,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Image.asset(
                          "assets/icons/youtube-removebg-preview.jpg",
                          height: 24,
                          width: 24),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                          "assets/icons/instagram-removebg-preview.jpg",
                          height: 24,
                          width: 24),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                          "assets/icons/twitter-removebg-preview.jpg",
                          height: 24,
                          width: 24),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                          "assets/icons/facebook__1_-removebg-preview.jpg",
                          height: 24,
                          width: 24),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget topYellowBanner() =>
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 15),
        Image.asset("assets/icons/eg.png"),
        TextButton(
            onPressed: () {},
            child: const DefaultSelectableText(
              "مصر",
              style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 0.08,
              ),
            )),
        TextButton(
            onPressed: () {},
            child: const DefaultSelectableText(
              "English",
              style: TextStyle(
                color: ColorManager.myBlack,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 0.08,
              ),
            )),
      ],
    );
