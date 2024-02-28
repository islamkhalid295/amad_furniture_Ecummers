import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/my_widget.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/routes_manager.dart';
import '../data/models/city_model.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
late  TextEditingController nameController = TextEditingController(text: AuthanticationCubit.userData?.user?.name);
late  TextEditingController phoneController = TextEditingController(text: AuthanticationCubit.userData?.user?.number);
final TextEditingController anotherPhoneController = TextEditingController();
   late  TextEditingController emailController = TextEditingController(text: AuthanticationCubit.userData?.user?.email);
   final TextEditingController landmarkController = TextEditingController();
   final TextEditingController addressController = TextEditingController();

bool flag = true;
  @override
  Widget build(BuildContext context) {
    CartCubit cubit = BlocProvider.of(context);
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (token != null && CartCubit.cartModel == null) {
      cubit.getCart();
    }
    if (CartCubit.cities == null && flag) {
      flag = false;
      cubit.getCitiesDeliveryPrices();
    }
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: BlocBuilder<AuthanticationCubit, AuthanticationState>(
  builder: (context, state) {
    if (token == 'null' || token == null) {
      return Center(
          child: AlertDialog(
            title: const Text('خطأ'),
            content: const Text('يجب تسجيل الدخول اولاً'),
            actions: [
              TextButton(
                onPressed: () => context.go(RoutesManager.loginScreen),
                child: const Text('تسجيل الدخول'),
              ),
            ],
          ));
    }
    if (AuthanticationCubit.userModel != null){
      nameController = TextEditingController(text: AuthanticationCubit.userModel?.name);
      phoneController = TextEditingController(text: AuthanticationCubit.userModel?.number);
      emailController = TextEditingController(text: AuthanticationCubit.userModel?.email);
    }

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultSelectableText(
                'تأكيد الطلب',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    color: ColorManager.orderBackgroundColor,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'بيانات الدفع',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 15),
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
                        const Text(
                          'وسائل الدفع',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ListTile(
                      title: const Text('الدفع عند الأستلام'),
                      leading: Radio<String>(
          activeColor: ColorManager.myYellow,

                        value: "cash",
                        groupValue: "cash",
                        onChanged: (String? value) {
                          // setState(() {
                          //   _character = value;
                          // });
                        },
                      ),
                    ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 15),
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

                        state is GetUserLoading || AuthanticationCubit.userModel == null ? const Center(child: CircularProgressIndicator()) : Form(
                                    key: CartCubit.formKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            // DefaultTextFormField(
                                            //   title: 'الاسم الاول',
                                            //   backgroundColor: ColorManager.orderBackgroundColor,
                                            //   s
                                            // ),
                                            Expanded(child:
                                            OrderTextFormField(
                                              hintText: 'الاسم',
                                            validator:  CartCubit.nameValidator,
                                              controller: nameController,
                                            )),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(hintText: 'رقم الهاتف',
                                            validator: CartCubit.phoneValidator,
                                            controller: phoneController,)),
                                            const SizedBox(width: 40,),
                                            Expanded(child: OrderTextFormField(hintText: 'رقم اخر' ,validator: CartCubit.anotherPhoneValidator,controller: anotherPhoneController,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(
                                              hintText: 'البريد الإلكتروني',
                                              validator: CartCubit.emailValidator,
                                            controller: emailController,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(hintText: 'العنوان',
                                              validator: CartCubit.nameValidator,
                                            controller: addressController,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(hintText: 'اقرب علامة مميزة',
                                              validator: CartCubit.nameValidator,
                                              controller: landmarkController,)),
                                          ],
                                        ),
                                        BlocBuilder<CartCubit, CartState>(
                                          buildWhen: (previous, current) => current is GetCitiesDeliveryPricesLoading || current is GetCitiesDeliveryPricesSuccess || current is GetCitiesDeliveryPricesError || current is ChangeCityDropDownMenuState,
                                          builder: (context, state) {
                                            return Center(
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
                                                      CartCubit.deliveryCity = city;

                                                      CartCubit
                                                          .cityDropDownMenuError =
                                                      null;
                                                    }
                                                  },
                                                  initialSelection: CartCubit.deliveryCity,
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
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),

              Center(child: DefaultMaterialButton(

                  onPressed: ()async{

                    if(CartCubit.formKey.currentState!.validate() && CartCubit.cityDropDownMenuController.text != "" ){
                      context.pushNamed(RoutesManager.orderSummaryScreen,
                          pathParameters: {
                            'firstName': nameController.text,
                            'phone': phoneController.text,
                            'anotherPhone': anotherPhoneController.text == ""? '_' : anotherPhoneController.text,
                            'email': emailController.text,
                            'landmark': landmarkController.text,
                            'address': addressController.text,
                            'delivery' : CartCubit.deliveryCity?.deliveryPrice ??"0",
                            'city' : CartCubit.deliveryCity?.name ?? "_",
                          });
                      // orderError = await cubit.orderTheCart(orderTheCartModel: OrderTheCartModel(paymentMethod: paymentMethod,city: CartCubit.deliveryCity?.id,destination: addressController.text,lastName: secondNameController.text,secondNumber: anotherPhoneController.text));
                    }else if(CartCubit.cityDropDownMenuController.text == "" ){
                      cubit
                          .cityDropDownMenuValidationError();
                    }
                  }, text: 'اتمام الطلب'))
            ],
          ),
        ),
      );
  },
),
    );
  }
}
