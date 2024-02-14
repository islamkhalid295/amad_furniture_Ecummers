import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/data/models/create_account_model.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/my_widget.dart';


class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit cubit = BlocProvider.of(context);
    return BlocBuilder<AuthanticationCubit, AuthanticationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDADADA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          AssetsManager.camponyLogo,
                          width: 372,
                          height: 148,
                          cacheHeight: 148,
                          cacheWidth: 372,
                          scale: 3,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Form(
                              key: AuthanticationCubit.createAccountFormKey,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 167,
                                      height: 27,
                                      child: Text(
                                        'انشاء حساب ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorManager.myBlack,
                                          fontSize: 22.80,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'سجل الان',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorManager.myBlack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        DefaultTextFormField(
                                          width: 140,
                                            validator:
                                            AuthanticationCubit.nameValidator,
                                            controller:
                                            AuthanticationCubit.firstNameController,
                                            title: "الاسم الاول",
                                            icon: Icon(Icons.person_outline)),
                                        SizedBox(width: 20,),
                                        DefaultTextFormField(
                                          onFieldSubmitted: (value) {
                                            print(AuthanticationCubit.firstNameController.text + " " + AuthanticationCubit.secondNameController.text);
                                          },
                                            maxLines: 1,
                                          width: 140,
                                            // validator:
                                            //     AuthanticationCubit.nameValidator,
                                            controller:
                                                AuthanticationCubit.secondNameController,
                                            title: "الاسم الاخير",
                                            icon: Icon(Icons.person_outline)),
                                      ],
                                    ),
                                    DefaultTextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        validator:
                                            AuthanticationCubit.emailValidator,
                                        controller:
                                            AuthanticationCubit.emailController,
                                        title: "البريد الإلكتروني",
                                        icon: Icon(Icons.email_outlined)),
                                    DefaultTextFormField(
                                        validator:
                                            AuthanticationCubit.phoneValidator,
                                        controller:
                                            AuthanticationCubit.phoneController,
                                        title: "رقم الهاتف",
                                        icon: Icon(Icons.phone_outlined)),
                                    DefaultTextFormField(
                                      maxLines: 1,
                                      obscureText:AuthanticationCubit.isPassword1,
                                      validator:
                                          AuthanticationCubit.passwordValidator,
                                      controller:
                                          AuthanticationCubit.passwordController,
                                      title: "كلمة السر",
                                      icon: Icon(
                                        Icons.vpn_key_outlined,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.showOrHidePassword1();
                                          },
                                          icon:
                                               AuthanticationCubit.isPassword1 ? Icon(Icons.visibility_outlined,color: ColorManager.myGray) : Icon(Icons.visibility_off_outlined,color: ColorManager.myGray)),
                                    ),
                                    DefaultTextFormField(
                                      maxLines: 1,
                                      obscureText: AuthanticationCubit.isPassword2,
                                      validator:
                                          AuthanticationCubit.rePasswordValidator,
                                      controller:
                                          AuthanticationCubit.rePasswordController,
                                      title: "تأكيد كلمة السر",
                                      icon: const Icon(Icons.vpn_key_outlined,color: ColorManager.myGray),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.showOrHidePassword2();
                                          },
                                          icon:
                                          AuthanticationCubit.isPassword2 ? Icon(Icons.visibility_outlined,color: ColorManager.myGray) : Icon(Icons.visibility_off_outlined,color: ColorManager.myGray)),

                                    ),
                                    const SizedBox(height: 24),
                                    state is CreateAccountError ? Padding(
                                      padding: const EdgeInsets.only(bottom: 24),
                                      child: Text(state.error,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red)),
                                    ) : SizedBox(),
                                    DefaultMaterialButton(
                                      lodingCondition: state is CreateAccountLoading,
                                        errorCondition: state is CreateAccountError,
                                        succsessCondition: state is CreateAccountSuccsess,
                                        borderRadius: 8,
                                        text: "انشاء حساب",
                                        onPressed: () {
                                          if (AuthanticationCubit
                                              .createAccountFormKey.currentState
                                              !.validate()) {
                                            cubit.createAccount(CreateAccountModel(
                                                email: AuthanticationCubit
                                                    .emailController.text,
                                                name: AuthanticationCubit
                                                    .firstNameController.text + " " + AuthanticationCubit.secondNameController.text,
                                                number: AuthanticationCubit
                                                    .phoneController.text,
                                                password: AuthanticationCubit
                                                    .passwordController.text));
                                          }
                                        }),
                                    const SizedBox(height: 24),
                                    Text(
                                      'لدي  حساب؟',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF6C757D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: ()=> context.go(RoutesManager.loginScreen),
                                      child: Text(
                                        'تسجيل الدخول',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF131313),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  MediaQuery.of(context).size.width < 700
                      ? Container()
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0, -0.5),
                                end: Alignment(0, 1.6),
                                colors: [
                                  Color(0xFFFBB710),
                                  Color(0xFF21201D),
                                  Color(0xFFFBB710)
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'منتجات للعنايه بالشعر',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 444,
                                    child: Text(
                                      textAlign: TextAlign.right,
                                      'العنايه بالشعر من أكثر ما يشغل الفتيات والسيدات، خاصة نموه وزيادة طوله، لذا تحرص العديد منهن على اللجوء لموضة الاكستينشين وتطويل الشعر بشكل ظاهرى فقط،',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 23),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 8),
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: ()=> context.go(RoutesManager.homeScreen),
                                      child: Text(
                                        'تعرف علي المزيد',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              state is CreateAccountSuccsess ? AlertDialog(
                title: Text('تم انشاء الحساب بنجاح'),
                content: Text('الرجاء تفعيل الحساب عن طريق الضغط علي الرابط الذي تم ارسالة الي البريد الإلكتروني الخاص بك'),
                actions: [
                  TextButton(
                    onPressed: ()=> context.go(RoutesManager.loginScreen),
                    child: Text('تسجيل الدخول'),
                  ),
                ],
              ) : Container(),
            ],
          ),
        );
      },
    );
  }
}
