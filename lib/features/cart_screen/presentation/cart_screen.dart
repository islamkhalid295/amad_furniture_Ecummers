import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:amad_furniture/features/cart_screen/data/models/city_model.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../data/models/promocode_request_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  late double totalPrice = 0;
  String couponError = "";
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = BlocProvider.of(context);
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (token != null) {
      cubit.getCart().then((value) {
        totalPrice = (CartCubit.cartModel?.cart?.totalPrice) ?? -999;
      });
    }
    if (CartCubit.cities == null && flag && token != null) {
      flag = false;
      cubit.getCitiesDeliveryPrices();
    }

    return Scaffold(
      appBar: const DefaultAppBar(),
      body: BlocBuilder<AuthanticationCubit, AuthanticationState>(
        builder: (context, state) {
          if ((token == 'null' || token == null) && state is! GetTokenLoading) {
            return Center(
                child: AlertDialog(
              title: const Text('عفواً'),
              content: const Text('يجب تسجيل الدخول اولاً'),
              actions: [
                TextButton(
                  onPressed: () => context.go(RoutesManager.loginScreen),
                  child: const Text('تسجيل الدخول'),
                ),
              ],
            ));
          }
          return BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current is GetCartSuccess ||
                current is GetCartError ||
                current is GetCartLoading,
            builder: (context, state) {
              // if(CategoriesCubit.productsListModel == null && !CategoriesCubit.poductsLoaded){
              //   CategoriesCubit.poductsLoaded = true;
              //   cubit.getProducts();
              // }
              // if(CategoriesCubit.categoriesList == null && !CategoriesCubit.categoryLoaded){
              //   CategoriesCubit.categoryLoaded = true;
              //   cubit.retriveCategories();
              // }
              if (state is GetCartError) {
                return const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                );
              } else if (state is GetCartSuccess) {
                return CartCubit.cartModel!.cart!.products!.isEmpty
                    ? Container(
                        height: getSectionHeight(context),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.myYellow.withOpacity(0.2),
                          ),
                          height: 300,
                          width: 300,
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.menu, color: ColorManager.myGrayLite),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "العربة فارغة",
                                style:
                                    TextStyle(color: ColorManager.myGrayLite),
                              )
                            ],
                          ),
                        )))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'عربة التسوق',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  color: ColorManager.myOffWhite,
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          width: cartProductImageSize - 20,
                                        )),
                                        const Expanded(
                                          child: Text(
                                            'الاسم',
                                            style: TextStyle(
                                              color: Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'السعر',
                                            style: TextStyle(
                                              color: Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'الكميه',
                                            style: TextStyle(
                                              color: Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 50),
                                        //   child: Container(
                                        //     height: 50,
                                        //     decoration: ShapeDecoration(
                                        //       shape: RoundedRectangleBorder(
                                        //         side: BorderSide(
                                        //           width: 1,
                                        //           strokeAlign:
                                        //               BorderSide.strokeAlignCenter,
                                        //           color: Colors.black.withOpacity(
                                        //               0.3199999928474426),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        const Expanded(
                                          child: Text(
                                            'الاجمالي',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: CartCubit.cartModel?.cart!.products!
                                          .map((e) => CartProductItem(
                                                product: e,
                                                amountController:
                                                    TextEditingController(
                                                        text: e.amount
                                                            .toString()),
                                              ))
                                          .toList() ??
                                      [],

                                  // children: [
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  //   CartProductItem(
                                  //       product: Products(
                                  //           id: "11",
                                  //           amount: 5,
                                  //           discount: 0,
                                  //           price: "400",
                                  //           image: "",
                                  //           name: "كريم مرطب",
                                  //           totalPrice: 400 * 5),
                                  //       amountController: TextEditingController(text: "4")),
                                  // ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
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
                                //التوصيل
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: DefaultSelectableText(
                                          textAlign: TextAlign.center,
                                          'التوصيل',
                                          style: TextStyle(
                                            color: Color(0xFF242424),
                                            fontSize: 26,
                                            fontFamily: 'Almarai',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: state
                                                        is GetCitiesDeliveryPricesLoading ||
                                                    CartCubit.cities == null
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : DropdownMenu<City>(
                                                    controller: CartCubit
                                                        .cityDropDownMenuController,
                                                    errorText: CartCubit
                                                        .cityDropDownMenuError,
                                                    requestFocusOnTap: true,
                                                    width: 450 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        1440,
                                                    label:
                                                        const Text('المحافظة'),
                                                    inputDecorationTheme:
                                                        const InputDecorationTheme(
                                                            filled: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            5.0,
                                                                        horizontal:
                                                                            5),
                                                            fillColor:
                                                                ColorManager
                                                                    .myOffWhite,
                                                            border: InputBorder
                                                                .none),
                                                    onSelected: (City? city) {
                                                      if (city != null) {
                                                        cubit.onCitySelected(
                                                            city);
                                                        CartCubit.selectedCity =
                                                            city;
                                                        totalPrice = (CartCubit
                                                                .cartModel
                                                                ?.cart
                                                                ?.totalPrice)! +
                                                            double.parse(CartCubit
                                                                    .deliveryCity
                                                                    ?.deliveryPrice ??
                                                                '0');
                                                        CartCubit
                                                                .cityDropDownMenuError =
                                                            null;
                                                      }
                                                    },
                                                    dropdownMenuEntries: CartCubit
                                                                .cities ==
                                                            null
                                                        ? []
                                                        : CartCubit.cities!.map<
                                                            DropdownMenuEntry<
                                                                City>>(
                                                            (City city) {
                                                              return DropdownMenuEntry<
                                                                  City>(
                                                                value: city,
                                                                label:
                                                                    "${city.name}  ج.م  - ${city.deliveryPrice} ",
                                                              );
                                                            },
                                                          ).toList(),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: cartProductImageSize,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Colors.black.withOpacity(
                                                  0.3199999928474426),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            const DefaultSelectableText(
                                              "المبلغ شامل التوصيل",
                                              style: TextStyle(
                                                color: Color(0xFF242424),
                                                fontSize: 16,
                                                fontFamily: 'Almarai',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: DefaultSelectableText(
                                                totalPrice.toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Color(0xFF242424),
                                                  fontSize: 16,
                                                  fontFamily: 'Almarai',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
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
                                //اكواد الخصم
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: DefaultSelectableText(
                                          textAlign: TextAlign.center,
                                          'اكود الخصم',
                                          style: TextStyle(
                                            color: Color(0xFF242424),
                                            fontSize: 26,
                                            fontFamily: 'Almarai',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child:
                                            BlocBuilder<CartCubit, CartState>(
                                          buildWhen: (previous, current) =>
                                              current
                                                  is AddClientPromoCodeToCartError ||
                                              current
                                                  is AddClientPromoCodeToCartSuccess ||current is AddSellerPromoCodeToCartError || current is AddSellerPromoCodeToCartSuccess || current is AddClientPromoCodeToCartLoading || current is AddSellerPromoCodeToCartLoading,
                                          builder: (context, state) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                state is AddClientPromoCodeToCartError
                                                    ? DefaultSelectableText(
                                                        state.error,
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    : const SizedBox(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 280 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1440,
                                                      color: ColorManager
                                                          .myOffWhite,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10.0,
                                                                bottom: 4),
                                                        child: TextFormField(
                                                          controller: CartCubit
                                                              .clientCoponController,
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'كوبون العميل',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    DefaultMaterialButton(
                                                      lodingCondition: state
                                                              is AddClientPromoCodeToCartLoading ||
                                                          state
                                                              is DeleteClientPromoCodeFromCartLoading,
                                                      errorCondition: state
                                                              is AddClientPromoCodeToCartError ||
                                                          state
                                                              is DeleteClientPromoCodeFromCartError,
                                                      onPressed: () async {
                                                        if (CartCubit
                                                                .cartModel
                                                                ?.cart
                                                                ?.clientPromocode
                                                                ?.promocode ==
                                                            "") {
                                                          await cubit.addClientPromocodetoCart(
                                                              promoCodeModel: PromoCodeRequestModel(
                                                                  promocode:
                                                                      CartCubit
                                                                          .clientCoponController
                                                                          .text,
                                                                  type:
                                                                      "client"));
                                                        } else {
                                                          couponError = await cubit.deleteClientPromocodeFromCart(
                                                              promoCodeModel: PromoCodeRequestModel(
                                                                  promocode: CartCubit
                                                                      .cartModel
                                                                      ?.cart
                                                                      ?.clientPromocode
                                                                      ?.promocode,
                                                                  type:
                                                                      "client"));
                                                        }
                                                      },
                                                      text: CartCubit
                                                                  .cartModel
                                                                  ?.cart
                                                                  ?.clientPromocode
                                                                  ?.promocode !=
                                                              ""
                                                          ? 'حذف'
                                                          : "قدم",
                                                      textColor: CartCubit
                                                                  .cartModel
                                                                  ?.cart
                                                                  ?.clientPromocode
                                                                  ?.promocode !=
                                                              ""
                                                          ? Colors.red
                                                          : null,
                                                      minWidth: 120 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1440,
                                                      borderRadius: 0,
                                                    ),
                                                    CartCubit
                                                                .cartModel
                                                                ?.cart
                                                                ?.clientPromocode
                                                                ?.promocode !=
                                                            ""
                                                        ? Container(
                                                            height: 40,
                                                            width: 100 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1440,
                                                            color: ColorManager
                                                                .myYellow,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            10.0,
                                                                        bottom:
                                                                            4),
                                                                child:
                                                                    FittedBox(
                                                                  child: DefaultSelectableText(
                                                                      (CartCubit.cartModel?.cart?.clientPromocode?.value ??
                                                                              "") +
                                                                          (((CartCubit.cartModel?.cart?.clientPromocode!.type ?? "") == "percentage")
                                                                              ? '%'
                                                                              : 'ج.م -'),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20)),
                                                                )
                                                                // TextFormField(
                                                                //   decoration:
                                                                //   InputDecoration(
                                                                //     border:
                                                                //     InputBorder
                                                                //         .none,
                                                                //     hintText: CartCubit
                                                                //         .cartModel
                                                                //         ?.cart
                                                                //         ?.clientPromocode?.value,
                                                                //   ),
                                                                //   textAlign:
                                                                //   TextAlign
                                                                //       .center,
                                                                // ),
                                                                ),
                                                          )
                                                        : const SizedBox(),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 280 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1440,
                                                      color: ColorManager
                                                          .myOffWhite,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10.0,
                                                                bottom: 4),
                                                        child: TextFormField(
                                                          controller: CartCubit
                                                              .sellerCoponController,
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'كوبون التاجر',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    DefaultMaterialButton(
                                                      lodingCondition: state
                                                              is AddSellerPromoCodeToCartLoading ||
                                                          state
                                                              is DeleteSellerPromoCodeFromCartLoading,
                                                      errorCondition: state
                                                              is AddSellerPromoCodeToCartError ||
                                                          state
                                                              is DeleteSellerPromoCodeFromCartError,
                                                      onPressed: () async {
                                                        if (CartCubit
                                                                .cartModel
                                                                ?.cart
                                                                ?.sellerPromocode
                                                                ?.promocode ==
                                                            "") {
                                                          await cubit.addSellerPromocodetoCart(
                                                              promoCodeModel: PromoCodeRequestModel(
                                                                  promocode:
                                                                      CartCubit
                                                                          .sellerCoponController
                                                                          .text,
                                                                  type:
                                                                      "seller"));
                                                        } else {
                                                          couponError = await cubit.deleteSellerPromocodeFromCart(
                                                              promoCodeModel: PromoCodeRequestModel(
                                                                  promocode: CartCubit
                                                                      .cartModel
                                                                      ?.cart
                                                                      ?.sellerPromocode
                                                                      ?.promocode,
                                                                  type:
                                                                      "seller"));
                                                        }
                                                      },
                                                      text: CartCubit
                                                                  .cartModel
                                                                  ?.cart
                                                                  ?.sellerPromocode
                                                                  ?.promocode !=
                                                              ""
                                                          ? 'حذف'
                                                          : "قدم",
                                                      textColor: CartCubit
                                                                  .cartModel
                                                                  ?.cart
                                                                  ?.sellerPromocode
                                                                  ?.promocode !=
                                                              ""
                                                          ? Colors.red
                                                          : null,
                                                      minWidth: 120 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1440,
                                                      borderRadius: 0,
                                                    ),
                                                    CartCubit
                                                        .cartModel
                                                        ?.cart
                                                        ?.sellerPromocode
                                                        ?.promocode !=
                                                        ""
                                                        ? Container(
                                                      height: 40,
                                                      width: 100 *
                                                          MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width /
                                                          1440,
                                                      color: ColorManager
                                                          .myYellow,
                                                      alignment: Alignment
                                                          .center,
                                                      child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top:
                                                              7,
                                                              bottom:
                                                              4,
                                                          right: 5,left: 5),
                                                          child:
                                                          FittedBox(
                                                            child: DefaultSelectableText(
                                                                (CartCubit.cartModel?.cart?.sellerPromocode?.value ??
                                                                    "") +
                                                                    (((CartCubit.cartModel?.cart?.sellerPromocode!.type ?? "") == "percentage")
                                                                        ? '%'
                                                                        : '- ج.م'),
                                                                textAlign:
                                                                TextAlign
                                                                    .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    20)),
                                                          )
                                                        // TextFormField(
                                                        //   decoration:
                                                        //   InputDecoration(
                                                        //     border:
                                                        //     InputBorder
                                                        //         .none,
                                                        //     hintText: CartCubit
                                                        //         .cartModel
                                                        //         ?.cart
                                                        //         ?.clientPromocode?.value,
                                                        //   ),
                                                        //   textAlign:
                                                        //   TextAlign
                                                        //       .center,
                                                        // ),
                                                      ),
                                                    )
                                                        : const SizedBox(),
                                                  ],
                                                ),
                                                state is AddSellerPromoCodeToCartError
                                                    ? DefaultSelectableText(
                                                        state.error,
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: cartProductImageSize,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Colors.black.withOpacity(
                                                  0.3199999928474426),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            const DefaultSelectableText(
                                              "بعد الخصم",
                                              style: TextStyle(
                                                color: Color(0xFF242424),
                                                fontSize: 16,
                                                fontFamily: 'Almarai',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: DefaultSelectableText(
                                                ((CartCubit.cartModel?.cart
                                                            ?.totalPriceAfterPromocodes)! +
                                                        double.parse(CartCubit
                                                                .deliveryCity
                                                                ?.deliveryPrice ??
                                                            '0'))
                                                    .toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Color(0xFF242424),
                                                  fontSize: 16,
                                                  fontFamily: 'Almarai',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefaultMaterialButton(
                                        onPressed: () {
                                          if (CartCubit
                                                  .cityDropDownMenuController
                                                  .text !=
                                              "") {
                                            context
                                                .go(RoutesManager.orderScreen);
                                          } else {
                                            cubit
                                                .cityDropDownMenuValidationError();
                                          }
                                        },
                                        text: 'اتمام الطلب',
                                        minWidth: 360 *
                                            MediaQuery.of(context).size.width /
                                            1440,
                                        height: 60,
                                        borderRadius: 18),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    DefaultMaterialButton(
                                        onPressed: () {
                                          context.go(RoutesManager.homeScreen);
                                        },
                                        text: 'الغاء الطلب',
                                        minWidth: 360 *
                                            MediaQuery.of(context).size.width /
                                            1440,
                                        height: 60,
                                        borderRadius: 18,
                                        color: ColorManager.myWhite,
                                        textColor: ColorManager.myBlack,
                                        borderColor: ColorManager.myBlack),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // return state is GetCartLoading ||
              //         state is GetCitiesDeliveryPricesLoading
              //     ? const Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     : CartCubit.cartModel == null
              //         ? const Center(
              //             child: Icon(
              //               Icons.error_outline,
              //               color: Colors.red,
              //             ),
              //           )
              //         : CartCubit.cartModel!.cart!.products!.isEmpty
              //             ? Container(
              //                 height: getSectionHeight(context),
              //                 child: Center(
              //                     child: Container(
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: ColorManager.myYellow.withOpacity(0.2),
              //                   ),
              //                   height: 300,
              //                   width: 300,
              //                   child: const Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Icon(Icons.menu,
              //                           color: ColorManager.myGrayLite),
              //                       SizedBox(
              //                         height: 20,
              //                       ),
              //                       Text(
              //                         "العربة فارغة",
              //                         style: TextStyle(
              //                             color: ColorManager.myGrayLite),
              //                       )
              //                     ],
              //                   ),
              //                 )))
              //             : Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 60, vertical: 10),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         const Text(
              //                           'عربة التسوق',
              //                           textAlign: TextAlign.right,
              //                           style: TextStyle(
              //                             color: Colors.black,
              //                             fontSize: 28,
              //                             fontFamily: 'Almarai',
              //                             fontWeight: FontWeight.w700,
              //                           ),
              //                         ),
              //                         Container(
              //                           color: ColorManager.myOffWhite,
              //                           height: 45,
              //                           child: Padding(
              //                             padding: const EdgeInsets.symmetric(
              //                                 vertical: 10.0),
              //                             child: Row(
              //                               mainAxisSize: MainAxisSize.min,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.center,
              //                               children: [
              //                                 Expanded(
              //                                     child: Container(
              //                                   width:
              //                                       cartProductImageSize - 20,
              //                                 )),
              //                                 const Expanded(
              //                                   child: Text(
              //                                     'الاسم',
              //                                     style: TextStyle(
              //                                       color: Color(0xFF242424),
              //                                       fontSize: 16,
              //                                       fontFamily: 'Almarai',
              //                                       fontWeight: FontWeight.w400,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 const Expanded(
              //                                   child: Text(
              //                                     'السعر',
              //                                     style: TextStyle(
              //                                       color: Color(0xFF242424),
              //                                       fontSize: 16,
              //                                       fontFamily: 'Almarai',
              //                                       fontWeight: FontWeight.w400,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 const Expanded(
              //                                   child: Text(
              //                                     'الكميه',
              //                                     style: TextStyle(
              //                                       color: Color(0xFF242424),
              //                                       fontSize: 16,
              //                                       fontFamily: 'Almarai',
              //                                       fontWeight: FontWeight.w400,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 // Padding(
              //                                 //   padding: const EdgeInsets.only(left: 50),
              //                                 //   child: Container(
              //                                 //     height: 50,
              //                                 //     decoration: ShapeDecoration(
              //                                 //       shape: RoundedRectangleBorder(
              //                                 //         side: BorderSide(
              //                                 //           width: 1,
              //                                 //           strokeAlign:
              //                                 //               BorderSide.strokeAlignCenter,
              //                                 //           color: Colors.black.withOpacity(
              //                                 //               0.3199999928474426),
              //                                 //         ),
              //                                 //       ),
              //                                 //     ),
              //                                 //   ),
              //                                 // ),
              //                                 const Expanded(
              //                                   child: Text(
              //                                     'الاجمالي',
              //                                     textAlign: TextAlign.center,
              //                                     style: TextStyle(
              //                                       color: Color(0xFF242424),
              //                                       fontSize: 16,
              //                                       fontFamily: 'Almarai',
              //                                       fontWeight: FontWeight.w400,
              //                                     ),
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     Expanded(
              //                       child: SingleChildScrollView(
              //                         child: Column(
              //                           children:
              //                               CartCubit.cartModel?.cart!.products!
              //                                       .map((e) => CartProductItem(
              //                                             product: e,
              //                                             amountController:
              //                                                 TextEditingController(
              //                                                     text: e.amount
              //                                                         .toString()),
              //                                           ))
              //                                       .toList() ??
              //                                   [],
              //
              //                           // children: [
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           //   CartProductItem(
              //                           //       product: Products(
              //                           //           id: "11",
              //                           //           amount: 5,
              //                           //           discount: 0,
              //                           //           price: "400",
              //                           //           image: "",
              //                           //           name: "كريم مرطب",
              //                           //           totalPrice: 400 * 5),
              //                           //       amountController: TextEditingController(text: "4")),
              //                           // ],
              //                         ),
              //                       ),
              //                     ),
              //                     Column(
              //                       children: [
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               vertical: 5),
              //                           child: Container(
              //                             decoration: ShapeDecoration(
              //                               shape: RoundedRectangleBorder(
              //                                 side: BorderSide(
              //                                   width: 1,
              //                                   strokeAlign: BorderSide
              //                                       .strokeAlignCenter,
              //                                   color: Colors.black.withOpacity(
              //                                       0.3199999928474426),
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         //التوصيل
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               vertical: 30),
              //                           child: Row(
              //                             children: [
              //                               const Expanded(
              //                                 child: DefaultSelectableText(
              //                                   textAlign: TextAlign.center,
              //                                   'التوصيل',
              //                                   style: TextStyle(
              //                                     color: Color(0xFF242424),
              //                                     fontSize: 26,
              //                                     fontFamily: 'Almarai',
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ),
              //                               Expanded(
              //                                 flex: 3,
              //                                 child: Center(
              //                                   child: Container(
              //                                     alignment: Alignment.center,
              //                                     child: state
              //                                                 is GetCitiesDeliveryPricesLoading ||
              //                                             CartCubit.cities ==
              //                                                 null
              //                                         ? const Center(
              //                                             child:
              //                                                 CircularProgressIndicator())
              //                                         : DropdownMenu<City>(
              //                                             controller: CartCubit
              //                                                 .cityDropDownMenuController,
              //                                             errorText: CartCubit
              //                                                 .cityDropDownMenuError,
              //                                             requestFocusOnTap:
              //                                                 true,
              //                                             width: 450 *
              //                                                 MediaQuery.of(
              //                                                         context)
              //                                                     .size
              //                                                     .width /
              //                                                 1440,
              //                                             label: const Text(
              //                                                 'المحافظة'),
              //                                             inputDecorationTheme: const InputDecorationTheme(
              //                                                 filled: true,
              //                                                 contentPadding:
              //                                                     EdgeInsets.symmetric(
              //                                                         vertical:
              //                                                             5.0,
              //                                                         horizontal:
              //                                                             5),
              //                                                 fillColor:
              //                                                     ColorManager
              //                                                         .myOffWhite,
              //                                                 border:
              //                                                     InputBorder
              //                                                         .none),
              //                                             onSelected:
              //                                                 (City? city) {
              //                                               if (city != null) {
              //                                                 cubit
              //                                                     .onCitySelected(
              //                                                         city);
              //                                                 CartCubit
              //                                                         .selectedCity =
              //                                                     city;
              //                                                 totalPrice = (CartCubit
              //                                                         .cartModel
              //                                                         ?.cart
              //                                                         ?.totalPrice)! +
              //                                                     double.parse(CartCubit
              //                                                             .deliveryCity
              //                                                             ?.deliveryPrice ??
              //                                                         '0');
              //                                                 CartCubit
              //                                                         .cityDropDownMenuError =
              //                                                     null;
              //                                               }
              //                                             },
              //                                             dropdownMenuEntries: CartCubit
              //                                                         .cities ==
              //                                                     null
              //                                                 ? []
              //                                                 : CartCubit
              //                                                     .cities!
              //                                                     .map<
              //                                                         DropdownMenuEntry<
              //                                                             City>>(
              //                                                     (City city) {
              //                                                       return DropdownMenuEntry<
              //                                                           City>(
              //                                                         value:
              //                                                             city,
              //                                                         label:
              //                                                             "${city.name}  ج.م  - ${city.deliveryPrice} ",
              //                                                       );
              //                                                     },
              //                                                   ).toList(),
              //                                           ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               Container(
              //                                 height: cartProductImageSize,
              //                                 decoration: ShapeDecoration(
              //                                   shape: RoundedRectangleBorder(
              //                                     side: BorderSide(
              //                                       width: 1,
              //                                       strokeAlign: BorderSide
              //                                           .strokeAlignCenter,
              //                                       color: Colors.black
              //                                           .withOpacity(
              //                                               0.3199999928474426),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               Expanded(
              //                                 child: Column(
              //                                   children: [
              //                                     const DefaultSelectableText(
              //                                       "المبلغ شامل التوصيل",
              //                                       style: TextStyle(
              //                                         color: Color(0xFF242424),
              //                                         fontSize: 16,
              //                                         fontFamily: 'Almarai',
              //                                         fontWeight:
              //                                             FontWeight.w400,
              //                                       ),
              //                                     ),
              //                                     Directionality(
              //                                       textDirection:
              //                                           TextDirection.ltr,
              //                                       child:
              //                                           DefaultSelectableText(
              //                                         totalPrice
              //                                             .toStringAsFixed(2),
              //                                         style: const TextStyle(
              //                                           color:
              //                                               Color(0xFF242424),
              //                                           fontSize: 16,
              //                                           fontFamily: 'Almarai',
              //                                           fontWeight:
              //                                               FontWeight.w400,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               vertical: 5),
              //                           child: Container(
              //                             decoration: ShapeDecoration(
              //                               shape: RoundedRectangleBorder(
              //                                 side: BorderSide(
              //                                   width: 1,
              //                                   strokeAlign: BorderSide
              //                                       .strokeAlignCenter,
              //                                   color: Colors.black.withOpacity(
              //                                       0.3199999928474426),
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         //اكواد الخصم
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                               vertical: 30),
              //                           child: Row(
              //                             children: [
              //                               const Expanded(
              //                                 child: DefaultSelectableText(
              //                                   textAlign: TextAlign.center,
              //                                   'اكود الخصم',
              //                                   style: TextStyle(
              //                                     color: Color(0xFF242424),
              //                                     fontSize: 26,
              //                                     fontFamily: 'Almarai',
              //                                     fontWeight: FontWeight.w400,
              //                                   ),
              //                                 ),
              //                               ),
              //                               Expanded(
              //                                 flex: 3,
              //                                 child: Column(
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.center,
              //                                   children: [
              //                                     state is AddClientPromoCodeToCartError
              //                                         ? DefaultSelectableText(
              //                                             couponError,
              //                                             style:
              //                                                 const TextStyle(
              //                                                     color: Colors
              //                                                         .red),
              //                                           )
              //                                         : const SizedBox(),
              //                                     Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment
              //                                               .center,
              //                                       children: [
              //                                         Container(
              //                                           height: 40,
              //                                           width: 280 *
              //                                               MediaQuery.of(
              //                                                       context)
              //                                                   .size
              //                                                   .width /
              //                                               1440,
              //                                           color: ColorManager
              //                                               .myOffWhite,
              //                                           alignment: Alignment
              //                                               .centerRight,
              //                                           child: Padding(
              //                                             padding:
              //                                                 const EdgeInsets
              //                                                     .only(
              //                                                     top: 10.0,
              //                                                     bottom: 4),
              //                                             child: TextFormField(
              //                                               controller: CartCubit
              //                                                   .clientCoponController,
              //                                               decoration:
              //                                                   const InputDecoration(
              //                                                 border:
              //                                                     InputBorder
              //                                                         .none,
              //                                                 hintText:
              //                                                     'كوبون العميل',
              //                                               ),
              //                                               textAlign: TextAlign
              //                                                   .center,
              //                                             ),
              //                                           ),
              //                                         ),
              //                                         DefaultMaterialButton(
              //                                           lodingCondition: state
              //                                                   is AddClientPromoCodeToCartLoading ||
              //                                               state
              //                                                   is DeleteClientPromoCodeFromCartLoading,
              //                                           errorCondition: state
              //                                                   is AddClientPromoCodeToCartError ||
              //                                               state
              //                                                   is DeleteClientPromoCodeFromCartError,
              //                                           onPressed: () async {
              //                                             if (CartCubit
              //                                                     .cartModel
              //                                                     ?.cart
              //                                                     ?.clientPromocode ==
              //                                                 "") {
              //                                               couponError = await cubit.addClientPromocodetoCart(
              //                                                   promoCodeModel: PromoCodeModel(
              //                                                       promocode:
              //                                                           CartCubit
              //                                                               .clientCoponController
              //                                                               .text,
              //                                                       type:
              //                                                           "client"));
              //                                             } else {
              //                                               couponError = await cubit.deleteClientPromocodeFromCart(
              //                                                   promoCodeModel: PromoCodeModel(
              //                                                       promocode: CartCubit
              //                                                           .cartModel
              //                                                           ?.cart
              //                                                           ?.clientPromocode,
              //                                                       type:
              //                                                           "client"));
              //                                             }
              //                                           },
              //                                           text: CartCubit
              //                                                       .cartModel
              //                                                       ?.cart
              //                                                       ?.clientPromocode !=
              //                                                   ""
              //                                               ? 'حذف'
              //                                               : "قدم",
              //                                           textColor: CartCubit
              //                                                       .cartModel
              //                                                       ?.cart
              //                                                       ?.clientPromocode !=
              //                                                   ""
              //                                               ? Colors.red
              //                                               : null,
              //                                           minWidth: 120 *
              //                                               MediaQuery.of(
              //                                                       context)
              //                                                   .size
              //                                                   .width /
              //                                               1440,
              //                                           borderRadius: 0,
              //                                         ),
              //                                         CartCubit.cartModel?.cart
              //                                                     ?.clientPromocode !=
              //                                                 ""
              //                                             ? Container(
              //                                                 height: 40,
              //                                                 width: 100 *
              //                                                     MediaQuery.of(
              //                                                             context)
              //                                                         .size
              //                                                         .width /
              //                                                     1440,
              //                                                 color:
              //                                                     ColorManager
              //                                                         .myYellow,
              //                                                 alignment: Alignment
              //                                                     .centerRight,
              //                                                 child: Padding(
              //                                                   padding:
              //                                                       const EdgeInsets
              //                                                           .only(
              //                                                           top:
              //                                                               10.0,
              //                                                           bottom:
              //                                                               4),
              //                                                   child:
              //                                                       TextFormField(
              //                                                     decoration:
              //                                                         InputDecoration(
              //                                                       border:
              //                                                           InputBorder
              //                                                               .none,
              //                                                       hintText: CartCubit
              //                                                           .cartModel
              //                                                           ?.cart
              //                                                           ?.clientPromocode,
              //                                                     ),
              //                                                     textAlign:
              //                                                         TextAlign
              //                                                             .center,
              //                                                   ),
              //                                                 ),
              //                                               )
              //                                             : const SizedBox(),
              //                                       ],
              //                                     ),
              //                                     const SizedBox(
              //                                       height: 12,
              //                                     ),
              //                                     Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment
              //                                               .center,
              //                                       children: [
              //                                         Container(
              //                                           height: 40,
              //                                           width: 280 *
              //                                               MediaQuery.of(
              //                                                       context)
              //                                                   .size
              //                                                   .width /
              //                                               1440,
              //                                           color: ColorManager
              //                                               .myOffWhite,
              //                                           alignment: Alignment
              //                                               .centerRight,
              //                                           child: Padding(
              //                                             padding:
              //                                                 const EdgeInsets
              //                                                     .only(
              //                                                     top: 10.0,
              //                                                     bottom: 4),
              //                                             child: TextFormField(
              //                                               controller: CartCubit
              //                                                   .sellerCoponController,
              //                                               decoration:
              //                                                   const InputDecoration(
              //                                                 border:
              //                                                     InputBorder
              //                                                         .none,
              //                                                 hintText:
              //                                                     'كوبون التاجر',
              //                                               ),
              //                                               textAlign: TextAlign
              //                                                   .center,
              //                                             ),
              //                                           ),
              //                                         ),
              //                                         DefaultMaterialButton(
              //                                           lodingCondition: state
              //                                                   is AddSellerPromoCodeToCartLoading ||
              //                                               state
              //                                                   is DeleteSellerPromoCodeFromCartLoading,
              //                                           errorCondition: state
              //                                                   is AddSellerPromoCodeToCartError ||
              //                                               state
              //                                                   is DeleteSellerPromoCodeFromCartError,
              //                                           onPressed: () async {
              //                                             if (CartCubit
              //                                                     .cartModel
              //                                                     ?.cart
              //                                                     ?.sellerPromocode ==
              //                                                 "") {
              //                                               couponError = await cubit.addSellerPromocodetoCart(
              //                                                   promoCodeModel: PromoCodeModel(
              //                                                       promocode:
              //                                                           CartCubit
              //                                                               .sellerCoponController
              //                                                               .text,
              //                                                       type:
              //                                                           "seller"));
              //                                             } else {
              //                                               couponError = await cubit.deleteSellerPromocodeFromCart(
              //                                                   promoCodeModel: PromoCodeModel(
              //                                                       promocode: CartCubit
              //                                                           .cartModel
              //                                                           ?.cart
              //                                                           ?.sellerPromocode,
              //                                                       type:
              //                                                           "seller"));
              //                                             }
              //                                           },
              //                                           text: CartCubit
              //                                                       .cartModel
              //                                                       ?.cart
              //                                                       ?.sellerPromocode !=
              //                                                   ""
              //                                               ? 'حذف'
              //                                               : "قدم",
              //                                           textColor: CartCubit
              //                                                       .cartModel
              //                                                       ?.cart
              //                                                       ?.sellerPromocode !=
              //                                                   ""
              //                                               ? Colors.red
              //                                               : null,
              //                                           minWidth: 120 *
              //                                               MediaQuery.of(
              //                                                       context)
              //                                                   .size
              //                                                   .width /
              //                                               1440,
              //                                           borderRadius: 0,
              //                                         ),
              //                                         CartCubit.cartModel?.cart
              //                                                     ?.sellerPromocode !=
              //                                                 ""
              //                                             ? Container(
              //                                                 height: 40,
              //                                                 width: 100 *
              //                                                     MediaQuery.of(
              //                                                             context)
              //                                                         .size
              //                                                         .width /
              //                                                     1440,
              //                                                 color:
              //                                                     ColorManager
              //                                                         .myYellow,
              //                                                 alignment: Alignment
              //                                                     .centerRight,
              //                                                 child: Padding(
              //                                                   padding:
              //                                                       const EdgeInsets
              //                                                           .only(
              //                                                           top:
              //                                                               10.0,
              //                                                           bottom:
              //                                                               4),
              //                                                   child:
              //                                                       TextFormField(
              //                                                     decoration:
              //                                                         InputDecoration(
              //                                                       border:
              //                                                           InputBorder
              //                                                               .none,
              //                                                       hintText: CartCubit
              //                                                           .cartModel
              //                                                           ?.cart
              //                                                           ?.sellerPromocode,
              //                                                     ),
              //                                                     textAlign:
              //                                                         TextAlign
              //                                                             .center,
              //                                                   ),
              //                                                 ),
              //                                               )
              //                                             : const SizedBox(),
              //                                       ],
              //                                     ),
              //                                     state is AddSellerPromoCodeToCartError
              //                                         ? DefaultSelectableText(
              //                                             couponError,
              //                                             style:
              //                                                 const TextStyle(
              //                                                     color: Colors
              //                                                         .red),
              //                                           )
              //                                         : const SizedBox(),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Container(
              //                                 height: cartProductImageSize,
              //                                 decoration: ShapeDecoration(
              //                                   shape: RoundedRectangleBorder(
              //                                     side: BorderSide(
              //                                       width: 1,
              //                                       strokeAlign: BorderSide
              //                                           .strokeAlignCenter,
              //                                       color: Colors.black
              //                                           .withOpacity(
              //                                               0.3199999928474426),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               Expanded(
              //                                 child: Column(
              //                                   children: [
              //                                     const DefaultSelectableText(
              //                                       "بعد الخصم",
              //                                       style: TextStyle(
              //                                         color: Color(0xFF242424),
              //                                         fontSize: 16,
              //                                         fontFamily: 'Almarai',
              //                                         fontWeight:
              //                                             FontWeight.w400,
              //                                       ),
              //                                     ),
              //                                     Directionality(
              //                                       textDirection:
              //                                           TextDirection.ltr,
              //                                       child:
              //                                           DefaultSelectableText(
              //                                         ((CartCubit
              //                                                     .cartModel
              //                                                     ?.cart
              //                                                     ?.totalPriceAfterPromocodes)! +
              //                                                 double.parse(CartCubit
              //                                                         .deliveryCity
              //                                                         ?.deliveryPrice ??
              //                                                     '0'))
              //                                             .toStringAsFixed(2),
              //                                         style: const TextStyle(
              //                                           color:
              //                                               Color(0xFF242424),
              //                                           fontSize: 16,
              //                                           fontFamily: 'Almarai',
              //                                           fontWeight:
              //                                               FontWeight.w400,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             DefaultMaterialButton(
              //                                 onPressed: () {
              //                                   if (CartCubit
              //                                           .cityDropDownMenuController
              //                                           .text !=
              //                                       "") {
              //                                     context.go(RoutesManager
              //                                         .orderScreen);
              //                                   } else {
              //                                     cubit
              //                                         .cityDropDownMenuValidationError();
              //                                   }
              //                                 },
              //                                 text: 'اتمام الطلب',
              //                                 minWidth: 360 *
              //                                     MediaQuery.of(context)
              //                                         .size
              //                                         .width /
              //                                     1440,
              //                                 height: 60,
              //                                 borderRadius: 18),
              //                             const SizedBox(
              //                               width: 30,
              //                             ),
              //                             DefaultMaterialButton(
              //                                 onPressed: () {
              //                                   context.go(
              //                                       RoutesManager.homeScreen);
              //                                 },
              //                                 text: 'الغاء الطلب',
              //                                 minWidth: 360 *
              //                                     MediaQuery.of(context)
              //                                         .size
              //                                         .width /
              //                                     1440,
              //                                 height: 60,
              //                                 borderRadius: 18,
              //                                 color: ColorManager.myWhite,
              //                                 textColor: ColorManager.myBlack,
              //                                 borderColor:
              //                                     ColorManager.myBlack),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               );
            },
          );
        },
      ),
    );
  }
}
