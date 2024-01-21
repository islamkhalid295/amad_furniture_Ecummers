import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/Authantication/data/models/verifyForgetPasswordModel.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/assets_manager.dart';

class VerifyForgetPasswordScreen extends StatelessWidget {
  const VerifyForgetPasswordScreen({super.key});

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
                          child: BlocBuilder<
                              AuthanticationCubit,
                              AuthanticationState>(
                            builder: (context, state) {
                              if(state is VerifyForgetPasswordSuccsess){
                                context.go(RoutesManager.loginScreen);
                              }
                              return Form(
                                key: AuthanticationCubit.verifyForgetPasswordFormKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'هل نسيت كلمة السر؟',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorManager.myBlack,
                                        fontSize: 22.80,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'الرجاء ادخال كود التفعيل الذي تم ارسالة الي بريدك الإلكتروني للتو',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorManager.myBlack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    DefaultTextFormField(
                                        controller: AuthanticationCubit
                                            .tokenController,
                                        validator: AuthanticationCubit
                                            .tokenValidator,
                                        title: "كود التفعيل",
                                        icon: Icon(Icons.password)),
                                    DefaultTextFormField(
                                      obscureText: AuthanticationCubit.isPassword4,
                                      maxLines: 1,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              cubit.showOrHideNewPassword();
                                            },
                                            icon:
                                            AuthanticationCubit.isPassword4 ? Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined)),
                                        controller: AuthanticationCubit
                                            .newPasswordController,
                                        validator: AuthanticationCubit
                                            .passwordValidator,
                                        title: "كلمة السر الجديدة",
                                        icon: Icon(Icons.vpn_key_outlined)),
                                    const SizedBox(height: 10),
                                    state is VerifyForgetPasswordError ? Padding(
                                      padding: const EdgeInsets.only(bottom: 24),
                                      child: Text(state.error,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red)),
                                    ) : SizedBox(),
                                    DefaultMaterialButton(
                                        lodingCondition: state is VerifyForgetPasswordLoading,
                                        succsessCondition:  state is VerifyForgetPasswordSuccsess,
                                        errorCondition:  state is VerifyForgetPasswordError,
                                        minWidth: 200,
                                        text: "استمرار", onPressed: () {
                                      if (AuthanticationCubit
                                          .verifyForgetPasswordFormKey.currentState
                                      !.validate()) {
                                        cubit.verifyForgetPassword(VerifyForgetPasswordModel(token: AuthanticationCubit.tokenController.text, newPassword: AuthanticationCubit.newPasswordController.text));
                                      }
                                    }),

                                  ],
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
          MediaQuery
              .of(context)
              .size
              .width < 700 ? Container() : Expanded(
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
    );
  }
}
