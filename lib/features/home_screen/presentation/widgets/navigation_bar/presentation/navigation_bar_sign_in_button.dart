import 'package:cedage/core/utils/routes_manager.dart';
import 'package:cedage/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:cedage/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/my_widget.dart';

class NavigationBarSignInButton extends StatelessWidget {
  const NavigationBarSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthanticationCubit, AuthanticationState>(
        builder: (context, state) {
          AuthanticationCubit authanticationCubit = BlocProvider.of(context);
          if (
              AuthanticationCubit.userModel?.name != null) {
            return PopupMenuButton(
              itemBuilder: (context) => [PopupMenuItem(child: const Text("تسجيل خروج"),
              onTap: (){
                authanticationCubit.logout();
                // cartCubit.myTestState();
                context.go(RoutesManager.homeScreen);
              },)],
              position: PopupMenuPosition.under,
              offset: const Offset(50, 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.primary),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MediaQuery.sizeOf(context).width < 600 ? const Icon(CupertinoIcons.person_alt_circle) : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Text("مرحباً", style: TextStyle(
                          color: ColorManager.myGrayLite,
                          fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10,),
                      Text(
                          AuthanticationCubit.userModel?.name ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            );
          }
          else if (state is GetUserLoading) {
            return const CircularProgressIndicator();
          }
          else {
            return MediaQuery.sizeOf(context).width < 600 ?  IconButton(icon: const Icon(CupertinoIcons.person_crop_circle,color: ColorManager.primary,),onPressed: () => context.go(RoutesManager.loginScreen),) : DefaultTextButton(title: "تسجيل الدخول",
              onPressed: () => context.go(RoutesManager.loginScreen),);
          }
        });
  }
}