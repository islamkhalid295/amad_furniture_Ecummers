import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/my_widget.dart';
import '../../data/models/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit cubit = BlocProvider.of(context);
    return Scaffold(
      body: Row(
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
                    child: Container(
                      width: double.infinity,
                      child:
                          BlocBuilder<AuthanticationCubit, AuthanticationState>(
                        builder: (context, state) {
                         /* if (state is LoginSuccsess) {
                            context.go(RoutesManager.homeScreen);
                          }*/
                          return Form(
                            key: AuthanticationCubit.formKey,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 167,
                                    height: 27,
                                    child: Text(
                                      'تسجيل الدخول',
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
                                  DefaultTextFormField(
                                      paddingleft: 10,
                                  
                                    keyboardType: TextInputType.emailAddress,
                                      controller:
                                          AuthanticationCubit.emailController,
                                      validator:
                                          AuthanticationCubit.emailValidator,
                                      title: "البريد الإلكتروني",
                                      icon: Icon(Icons.email_outlined)),
                                  DefaultTextFormField(
                                    paddingleft: 10,
                                    controller:
                                        AuthanticationCubit.passwordController,
                                    validator:
                                        AuthanticationCubit.passwordValidator,
                                    maxLines: 1,
                                    title: "كلمة السر",
                                    obscureText: AuthanticationCubit.isPassword3,
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.showOrHidePassword3();
                                        },
                                        icon: AuthanticationCubit.isPassword3
                                            ? Icon(Icons.visibility_outlined,
                                                color: ColorManager.myGray)
                                            : Icon(Icons.visibility_off_outlined,
                                                color: ColorManager.myGray)),
                                    onFieldSubmitted: (value) {
                                      if (AuthanticationCubit
                                          .formKey.currentState!
                                          .validate()) {
                                        cubit.login(LoginModel(
                                            email: AuthanticationCubit
                                                .emailController.text,
                                            password: AuthanticationCubit
                                                .passwordController.text),context);
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .go(RoutesManager.forgetPasswordScreen);
                                    },
                                    child: Text(
                                      'هل نسيت كلمه السر؟',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  state is LoginError
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 24),
                                          child: Text(state.error,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        )
                                      : SizedBox(),
                                  DefaultMaterialButton(
                                      lodingCondition: state is LoginLoading,
                                      succsessCondition: state is LoginSuccsess,
                                      errorCondition: state is LoginError,
                                      text: "تسجيل الدخول",
                                      borderRadius: 8,
                                      onPressed: () {
                                        if (AuthanticationCubit
                                            .formKey.currentState!
                                            .validate()) {
                                          cubit.login(LoginModel(
                                              email: AuthanticationCubit
                                                  .emailController.text,
                                              password: AuthanticationCubit
                                                  .passwordController.text),context);
                                        }
                                      }),
                                  const SizedBox(height: 24),
                                  Text(
                                    'ليس لديك حساب؟',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => context
                                        .go(RoutesManager.createAccountScreen),
                                    child: Text(
                                      'انشاء حساب',
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
                          );
                        },
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
                              onPressed: () =>
                                  context.go(RoutesManager.homeScreen),
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
    );
  }
}
