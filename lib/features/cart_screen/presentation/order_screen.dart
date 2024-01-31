import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/my_widget.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultSelectableText(
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
                        Text(
                          'بيانات الدفع',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
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
                        Form(
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
                                  Expanded(child: OrderTextFormField(hintText: 'الاسم الاول',
                                  validator:  CartCubit.nameValidator,)),
                                  SizedBox(width: 40,),
                                  Expanded(child: OrderTextFormField(hintText: 'الاسم الثاني',
                                  validator: CartCubit.nameValidator,)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: OrderTextFormField(hintText: 'رقم الهاتف',
                                  validator: CartCubit.phoneValidator,)),
                                  SizedBox(width: 40,),
                                  Expanded(child: OrderTextFormField(hintText: 'رقم اخر' ,validator: CartCubit.phoneValidator)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: OrderTextFormField(hintText: 'البريد الإلكتروني',validator: CartCubit.emailValidator,)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: OrderTextFormField(hintText: 'المحافظة',validator: CartCubit.nameValidator,)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: OrderTextFormField(hintText: 'العنوان',validator: CartCubit.nameValidator,)),
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
              Center(child: DefaultMaterialButton(onPressed: (){
                if(CartCubit.formKey.currentState!.validate()){
                  print("تم الطلب");
                }
              }, text: 'اتمام الطلب'))
            ],
          ),
        ),
      ),
    );
  }
}
