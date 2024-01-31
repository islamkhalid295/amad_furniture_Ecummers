import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/my_widget.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:amad_furniture/features/cart_screen/data/models/order_data.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/routes_manager.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
late  TextEditingController firstNameController = TextEditingController(text: AuthanticationCubit.userModel?.name);
final TextEditingController secondNameController = TextEditingController();
late  TextEditingController phoneController = TextEditingController(text: AuthanticationCubit.userData?.user?.number);
final TextEditingController anotherPhoneController = TextEditingController();
   late  TextEditingController emailController = TextEditingController(text: AuthanticationCubit.userData?.user?.email);
   final TextEditingController governorateController = TextEditingController();
   final TextEditingController addressController = TextEditingController();
   late String orderError="";


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
    if (state is GetUserSuccsess){
      firstNameController = TextEditingController(text: AuthanticationCubit.userModel?.name);
      phoneController = TextEditingController(text: AuthanticationCubit.userData?.user?.number);
      emailController = TextEditingController(text: AuthanticationCubit.userData?.user?.email);
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
                        state is GetUserLoading || AuthanticationCubit.userData == null ? const Center(child: CircularProgressIndicator()) : Form(
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
                                              hintText: 'الاسم الاول',
                                            validator:  CartCubit.nameValidator,
                                              controller: firstNameController,
                                            )),
                                            const SizedBox(width: 40,),
                                            Expanded(child: OrderTextFormField(hintText: 'الاسم الثاني',
                                            validator: CartCubit.nameValidator,
                                            controller: secondNameController,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(hintText: 'رقم الهاتف',
                                            validator: CartCubit.phoneValidator,
                                            controller: phoneController,)),
                                            const SizedBox(width: 40,),
                                            Expanded(child: OrderTextFormField(hintText: 'رقم اخر' ,validator: CartCubit.phoneValidator,controller: anotherPhoneController,)),
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
                                            Expanded(child: OrderTextFormField(hintText: 'المحافظة',
                                              validator: CartCubit.nameValidator,
                                            controller: governorateController,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: OrderTextFormField(hintText: 'العنوان',
                                              validator: CartCubit.nameValidator,
                                            controller: addressController,)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<CartCubit,CartState>(builder: (context, state) {
                return state is OrderTheCartError ? Center(child: DefaultSelectableText(orderError,style: const TextStyle(color: Colors.red),),) : const SizedBox();

              },),
              Center(child: DefaultMaterialButton(onPressed: ()async{
                if(CartCubit.formKey.currentState!.validate()){
                   orderError = await cubit.orderTheCart(orderData: OrderData(deliveryDestination: DeliveryDestination(additionalInfo: "",apartment: "",buildingNumber: "5",city: "cairo",district: ""),paymentMethod: "cash"));
                  print("تم الطلب");
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
