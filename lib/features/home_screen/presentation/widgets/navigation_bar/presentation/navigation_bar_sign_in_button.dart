import 'package:amad_furniture/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/color_manager.dart';

class NavigationBarSignInButton extends StatelessWidget {
  const NavigationBarSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return !HomeScreenCubit.isLogedIn ? Container(
      decoration:  BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius:  BorderRadius.circular(10)),
      child: TextButton(onPressed: (){}, child: FittedBox(
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
            Text("مرحباً",style: TextStyle(color: ColorManager.myGrayLite,fontWeight: FontWeight.bold)),
            SizedBox(width: 10,),
            Text(HomeScreenCubit.userName,style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
