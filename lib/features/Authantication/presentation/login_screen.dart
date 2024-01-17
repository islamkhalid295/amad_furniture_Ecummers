import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/widgets/default_material_button.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: SingleChildScrollView(
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
                                      title: "البريد الإلكتروني",
                                      icon: Icon(Icons.email_outlined)),
                                  DefaultTextFormField(
                                    title: "كلمة السر",
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: (){},
                                        icon: Icon(Icons.remove_red_eye_outlined)),
                                  ),
                                  const SizedBox(height: 10),
                                  TextButton(
                                    onPressed: (){},
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
                                  DefaultMaterialButton(
                                    minWidth: 200,
                                      text: "تسجيل الدخول", onPressed: () {}),
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
                                    onPressed: (){},
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          MediaQuery.of(context).size.width < 700 ? Container() : Expanded(
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
                      child: Text(
                        'تعرف علي المزيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
