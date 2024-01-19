import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../my_widget.dart';

class NavigationBarSignInButton extends StatelessWidget {
  const NavigationBarSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthanticationCubit.userModel?.name == null ? Container(
      decoration:  BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius:  BorderRadius.circular(10)),
      child: TextButton(
        onPressed: ()=> context.go('/authentication/create_account'),
       child: FittedBox(
        child: Text("تسجيل الدخول",style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w700,
        ),),
      )),
    ) : Container(
      decoration:  BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius:  BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            DefaultSelectableText("مرحباً",style: TextStyle(color: ColorManager.myGrayLite,fontWeight: FontWeight.bold)),
            SizedBox(width: 10,),
            DefaultSelectableText(AuthanticationCubit.userModel?.name ?? "",style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
