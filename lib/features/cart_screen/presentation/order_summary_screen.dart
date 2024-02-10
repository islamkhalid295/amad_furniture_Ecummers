import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../../core/widgets/default_material_button.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen(
      {required this.firstName,
      required this.secondName,
      required this.phone,
      required this.anotherPhone,
      required this.email,
      required this.landmark,
      required this.address,
        required this.delivery});

  String firstName;
  String secondName;
  String phone;
  String anotherPhone;
  String email;
  String landmark;
  String address;
  String delivery;

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = BlocProvider.of(context);
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (token != null ) {
      cubit.getCart();
    }
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 30),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultSelectableText(
                    'الفاتورة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        color: ColorManager.orderBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DefaultSelectableText(
                              'بيانات الدفع',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
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
                            Row(
                              children: [
                                DefaultSelectableText(
                                  'الاسم',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  firstName + " " + secondName,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DefaultSelectableText(
                                  'ارقام الهاتف',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  phone + ' ,',
                                  style: TextStyle(fontSize: 18),
                                ),
                                anotherPhone != ""
                                    ? DefaultSelectableText(
                                        anotherPhone,
                                        style: TextStyle(fontSize: 18),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            Row(
                              children: [
                                DefaultSelectableText(
                                  'المحافظة',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  CartCubit.deliveryCity?.name ?? "",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DefaultSelectableText(
                                  'العنوان',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  address,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DefaultSelectableText(
                                  'اقرب غلمة مميزة',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  landmark,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
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
                            const DefaultSelectableText(
                              'المشتريات',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                            state is GetCartLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : state is GetCartError
                                    ? const Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      )
                                    : state is GetCartSuccess
                                        ? Column(
                                            children: CartCubit
                                                    .cartModel?.cart!.products!
                                                    .map((e) =>
                                                        CartProductSummaryItem(
                                                          product: e,
                                                          amountController:
                                                              TextEditingController(
                                                                  text: e.amount
                                                                      .toString()),
                                                        ))
                                                    .toList() ??
                                                [],
                                          )
                                        : SizedBox(),
                             state is GetCartError
                                ? const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            )
                                : state is GetCartSuccess
                            ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                                Row(children: [
                                  DefaultSelectableText(
                                    'المبلغ الاجمالي ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: DefaultSelectableText(
                                      (CartCubit.cartModel?.cart?.totalPrice!
                                          .toStringAsFixed(2))??"" ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                                CartCubit.cartModel?.cart?.sellerPromocode?.promocode != "" || CartCubit.cartModel?.cart?.clientPromocode?.promocode != "" ? Row(children: [
                                  DefaultSelectableText(
                                    'المبلغ الاجمالي بعد الخصم ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: DefaultSelectableText(
                                      (CartCubit.cartModel?.cart
                                          ?.totalPriceAfterPromocodes)
                                          !.toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]):SizedBox(),
                                Row(children: [
                                  DefaultSelectableText(
                                    'التوصيل ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: DefaultSelectableText(
                                      (CartCubit.deliveryCity?.deliveryPrice)??"" ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  DefaultSelectableText(
                                    'المبلغ النهائي ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ) : SizedBox(),



                          ],
                        ),
                      ),
                    ),
                  ),
                  // BlocBuilder<CartCubit,CartState>(builder: (context, state) {
                  //   return state is OrderTheCartError ? Center(child: DefaultSelectableText(orderError,style: const TextStyle(color: Colors.red),),) : const SizedBox();
                  //
                  // },),
                  Center(
                      child: DefaultMaterialButton(
                          onPressed: () async {}, text: 'اتمام الطلب'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
