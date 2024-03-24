
import 'package:cedage/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../../core/widgets/default_material_button.dart';
import '../../Authantication/presentation/manager/authantication_cubit.dart';
import '../data/models/order_the_cart_model.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen(
      {super.key, required this.name,
      // required this.secondName,
      required this.phone,
      required this.anotherPhone,
      required this.email,
      required this.landmark,
      required this.address,
      required this.city,
        required this.delivery});

  // String secondName;
  final String name;
  final String phone;
  final String anotherPhone;
  final String email;
  final String landmark;
  final String address;
  final String delivery;
  final String city;

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
          padding:  EdgeInsets.symmetric(horizontal: 65 * MediaQuery.sizeOf(context).width / 1440, vertical: 30),
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
                    padding:  EdgeInsets.symmetric(
                        horizontal: 10* MediaQuery.sizeOf(context).width / 1440),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        color: ColorManager.orderBackgroundColor,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 40 * MediaQuery.sizeOf(context).width / 1440, vertical: 25),
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
                                const DefaultSelectableText(
                                  'الاسم',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  name ,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const DefaultSelectableText(
                                  'ارقام الهاتف',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: DefaultSelectableText(
                                    phone ,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                anotherPhone != "_"
                                    ? Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: DefaultSelectableText(
                                          '$anotherPhone ,',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                    )
                                    : const SizedBox(),
                              ],
                            ),
                            Row(
                              children: [
                                const DefaultSelectableText(
                                  'المحافظة',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  city,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const DefaultSelectableText(
                                  'العنوان',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  address,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const DefaultSelectableText(
                                  'اقرب غلمة مميزة',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultSelectableText(
                                  landmark,
                                  style: const TextStyle(fontSize: 18),
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
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : state is GetCartError
                                    ? const Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      )
                                     : Column(
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
                                          ),

                             state is GetCartError
                                ? const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            )
                                : state is !GetCartLoading
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
                                  const DefaultSelectableText(
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
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                                CartCubit.cartModel?.cart?.sellerPromocode?.promocode != "" || CartCubit.cartModel?.cart?.clientPromocode?.promocode != "" ? Row(children: [
                                  const DefaultSelectableText(
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
                                      ((CartCubit.cartModel?.cart
                                          ?.totalPriceAfterPromocodes)
                                          ??0).toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]):const SizedBox(),
                                Row(children: [
                                  const DefaultSelectableText(
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
                                      delivery ,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const DefaultSelectableText(
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
                                      (((CartCubit.cartModel?.cart?.totalPriceAfterPromocodes)??0) + double.parse(delivery)).toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ) : const SizedBox(),



                          ],
                        ),
                      ),
                    ),
                  ),
                  // BlocBuilder<CartCubit,CartState>(builder: (context, state) {
                  //   return state is OrderTheCartError ? Center(child: DefaultSelectableText(orderError,style: const TextStyle(color: Colors.red),),) : const SizedBox();
                  //
                  // },),
                  BlocBuilder<CartCubit,CartState>(builder: (context, state) {
                    return state is OrderTheCartError ? Center(child: DefaultSelectableText(state.error,style: const TextStyle(color: Colors.red),),) : const SizedBox();

                  },),
                  Center(
                      child: DefaultMaterialButton(
                          lodingCondition: state is OrderTheCartLoading,
                          succsessCondition: state is OrderTheCartSuccess,
                          errorCondition:  state is OrderTheCartError,
                          onPressed: () async {
                            await cubit.orderTheCart(orderTheCartModel: OrderTheCartModel(paymentMethod: paymentMethod,city: CartCubit.deliveryCity?.id,destination: address,lastName: null,secondNumber: anotherPhone == '_' ? null : anotherPhone)).then((value) {
                              if(value == 'done'){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("تم ارسال الطلب بنجاح",style: TextStyle(color: ColorManager.myBlack),),
                                  backgroundColor: ColorManager.primary,
                                ));
                              }
                            });
                          }, text: 'اتمام الطلب'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
