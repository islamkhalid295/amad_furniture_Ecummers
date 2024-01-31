import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:amad_furniture/features/cart_screen/data/models/city_model.dart';
import 'package:amad_furniture/features/cart_screen/data/models/promocode_model.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/shop_cart_icon.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  late double totalPrice = 0;
  String couponError = "";
  @override
  Widget build(BuildContext context) {
    CartCubit cubit = BlocProvider.of(context);
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (CartCubit.cities == null) {
      cubit.getCitiesDeliveryPrices();
    }
    if (token != null ) {
      cubit.getCart().then((value) {
        totalPrice = (CartCubit.cartModel?.cart?.totalPrice) ?? -999;
      });
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: tabBarHeight,
        backgroundColor: ColorManager.myWhite,
        leading: Padding(
          padding: EdgeInsets.only(
              right: (90 * MediaQuery.of(context).size.width / 1235)),
          child: Image.asset("assets/icons/Link → logo.png.png"),
        ),
        leadingWidth: MediaQuery.of(context).size.width < 800
            ? 200 * MediaQuery.of(context).size.width / 800
            : 200,
        title: DefaultTextButton(
            onPressed: () {
              context.go(RoutesManager.homeScreen);
            },
            title: "الرئيسية"),

        titleSpacing: 100,
        // title: TabBar(
        //   controller: _tabController,
        //   onTap: (index) {
        //     _scrollController.scrollToIndex(index,
        //         preferPosition: AutoScrollPosition.begin);
        //     _onSectionChange(index);
        //   },
        //   tabs: HomeScreenCubit.tabBarTabs,
        //   indicatorColor: ColorManager.myYellow,
        //   labelStyle: const TextStyle(
        //     color: Colors.black,
        //     fontSize: 16,
        //     fontFamily: 'Almarai',
        //     fontWeight: FontWeight.w700,
        //   ),
        //   indicatorSize: TabBarIndicatorSize.label,
        //   dividerHeight: 0,
        //   labelPadding: EdgeInsets.symmetric(
        //       horizontal: 40 * MediaQuery.of(context).size.width / 1440),
        //   isScrollable: true,
        //
        // ),
        actions: [
          SizedBox(
            width: 30 * MediaQuery.of(context).size.width / 1440,
          ),
          const ShopCart(),
          SizedBox(
            width: 30 * MediaQuery.of(context).size.width / 1440,
          ),
          const NavigationBarSignInButton(),
          // Container(
          //   decoration: BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius: BorderRadius.circular(10)),
          //   child: TextButton(onPressed: ()=> context.go('/authentication/create_account'), child: Text("تسجيل الدخول",style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 16,
          //     fontFamily: 'Almarai',
          //     fontWeight: FontWeight.w700,
          //   ),)),
          // ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          // if(CategoriesCubit.productsListModel == null && !CategoriesCubit.poductsLoaded){
          //   CategoriesCubit.poductsLoaded = true;
          //   cubit.getProducts();
          // }
          // if(CategoriesCubit.categoriesList == null && !CategoriesCubit.categoryLoaded){
          //   CategoriesCubit.categoryLoaded = true;
          //   cubit.retriveCategories();
          // }
          if (token == 'null' || token == null) {
            return Center(
                child: AlertDialog(
              title: Text('خطأ'),
              content: Text('يجب تسجيل الدخول اولاً'),
              actions: [
                TextButton(
                  onPressed: () => context.go(RoutesManager.loginScreen),
                  child: Text('تسجيل الدخول'),
                ),
              ],
            ));
          }
          return state is! GetCartSuccess && CartCubit.cartModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Container(
                                      height: 50,
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
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'الاجمالي',
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
                                                  text: e.amount.toString()),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.black
                                        .withOpacity(0.3199999928474426),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //التوصيل
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Expanded(
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
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: state is GetCitiesDeliveryPricesLoading ||
                                              CartCubit.cities == null
                                          ? Center(
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
                                              label: const Text('المحافظة'),
                                              inputDecorationTheme:
                                                  const InputDecorationTheme(
                                                      filled: true,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0,
                                                              horizontal: 5),
                                                      fillColor: ColorManager
                                                          .myOffWhite,
                                                      border: InputBorder.none),
                                              onSelected: (City? city) {
                                                if (city != null) {
                                                  cubit.onCitySelected(city);
                                                  totalPrice = (CartCubit
                                                          .cartModel
                                                          ?.cart
                                                          ?.totalPrice)! +
                                                      double.parse(CartCubit
                                                              .deliveryCity
                                                              ?.name ??
                                                          '0');
                                                }
                                              },
                                              dropdownMenuEntries: CartCubit
                                                          .cities ==
                                                      null
                                                  ? []
                                                  : CartCubit.cities!.map<
                                                      DropdownMenuEntry<City>>(
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
                                Expanded(
                                  child: Column(
                                    children: [
                                      DefaultSelectableText(
                                        "المبلغ شامل التوصيل",
                                        style: const TextStyle(
                                          color: Color(0xFF242424),
                                          fontSize: 16,
                                          fontFamily: 'Almarai',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: DefaultSelectableText(
                                          CartCubit.deliveryCity != null
                                              ? (totalPrice).toStringAsFixed(2)
                                              : totalPrice.toStringAsFixed(2),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.black
                                        .withOpacity(0.3199999928474426),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //اكواد الخصم
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Expanded(
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
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      state is AddClientPromoCodeToCartError ? DefaultSelectableText(couponError,style: TextStyle(color: Colors.red),): SizedBox(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 280 * MediaQuery.of(context).size.width / 1440,
                                            color: ColorManager.myOffWhite,
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, bottom: 4),
                                              child: TextFormField(
                                                controller: CartCubit.clientCoponController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'كوبون العميل',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DefaultMaterialButton(
                                            lodingCondition: state is AddClientPromoCodeToCartLoading || state is DeleteClientPromoCodeFromCartLoading,
                                            errorCondition: state is AddClientPromoCodeToCartError || state is DeleteClientPromoCodeFromCartError,
                                            onPressed: () async {
                                              if(CartCubit.cartModel?.cart?.clientPromocode == ""){
                                                couponError = await cubit.addClientPromocodetoCart(
                                                    promoCodeModel: PromoCodeModel(
                                                        promocode: CartCubit
                                                            .clientCoponController
                                                            .text,
                                                        type: "client"));
                                              }else{
                                                cubit.deleteClientPromocodeFromCart(
                                                    promoCodeModel: PromoCodeModel(
                                                        promocode: CartCubit.cartModel?.cart?.clientPromocode,
                                                        type: "client"));
                                              }
                                            },
                                            text: CartCubit.cartModel?.cart?.clientPromocode != "" ? 'حذف' : "قدم",
                                            textColor: CartCubit.cartModel?.cart?.clientPromocode != "" ? Colors.red : null,
                                            minWidth: 120 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1440,
                                            borderRadius: 0,
                                          ),
                                          CartCubit.cartModel?.cart?.clientPromocode != "" ? Container(
                                            height: 40,
                                            width: 100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1440,
                                            color: ColorManager.myYellow,
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, bottom: 4),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: CartCubit.cartModel?.cart?.clientPromocode,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ):SizedBox(),
                                          
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 280 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1440,
                                            color: ColorManager.myOffWhite,
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, bottom: 4),
                                              child: TextFormField(
                                                controller: CartCubit.sellerCoponController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'كوبون التاجر',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          DefaultMaterialButton(
                                            lodingCondition: state is AddSellerPromoCodeToCartLoading || state is DeleteSellerPromoCodeFromCartLoading,
                                            errorCondition: state is AddSellerPromoCodeToCartError || state is DeleteSellerPromoCodeFromCartError,
                                            onPressed: () async{
                                              if(CartCubit.cartModel?.cart?.sellerPromocode == ""){
                                                cubit.addSellerPromocodetoCart(
                                                    promoCodeModel: PromoCodeModel(
                                                        promocode: CartCubit
                                                            .sellerCoponController
                                                            .text,
                                                        type: "seller"));
                                              }else{
                                                couponError = await cubit.deleteSellerPromocodeFromCart(
                                                    promoCodeModel: PromoCodeModel(
                                                        promocode: CartCubit.cartModel?.cart?.sellerPromocode,
                                                        type: "seller"));
                                              }
                                            },
                                            text: CartCubit.cartModel?.cart?.sellerPromocode != "" ? 'حذف' : "قدم",
                                            textColor: CartCubit.cartModel?.cart?.sellerPromocode != "" ? Colors.red : null,
                                            minWidth: 120 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1440,
                                            borderRadius: 0,
                                          ),
                                          CartCubit.cartModel?.cart?.sellerPromocode != "" ? Container(
                                            height: 40,
                                            width: 100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1440,
                                            color: ColorManager.myYellow,
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, bottom: 4),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: CartCubit.cartModel?.cart?.sellerPromocode,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ):SizedBox(),

                                        ],
                                      ),
                                      state is AddSellerPromoCodeToCartError ? DefaultSelectableText(couponError,style: TextStyle(color: Colors.red),): SizedBox(),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      DefaultSelectableText(
                                        "بعد الخصم",
                                        style: const TextStyle(
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
                                                          .deliveryCity?.name ??
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
                                            .cityDropDownMenuController.text !=
                                        "") {
                                      context.go(RoutesManager.orderScreen);
                                    } else {
                                      cubit.cityDropDownMenuValidationError();
                                    }
                                  },
                                  text: 'اتمام الطلب',
                                  minWidth: 360 *
                                      MediaQuery.of(context).size.width /
                                      1440,
                                  height: 60,
                                  borderRadius: 18),
                              SizedBox(
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
        },
      ),
    );
  }
}
