import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
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
          if (
              AuthanticationCubit.userModel?.name != null) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.myYellow),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const DefaultSelectableText("مرحباً", style: TextStyle(
                        color: ColorManager.myGrayLite,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10,),
                    DefaultSelectableText(
                        AuthanticationCubit.userModel?.name ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }
          else if (state is GetUserLoading) {
            return const CircularProgressIndicator();
          }
          else {
            return DefaultTextButton(title: "تسجيل الدخول",
              onPressed: () => context.go(RoutesManager.loginScreen),);
          }
        });
  }
}