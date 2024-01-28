import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/api/dio_consummer.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../../../Authantication/data/data_sources/Authantication_rds.dart';
import '../../../../../Authantication/domain/repositories/Authantication_repo.dart';
import '../../../../../Authantication/domain/use_cases/create_account_uc.dart';
import '../../../../../Authantication/domain/use_cases/forget_password_uc.dart';
import '../../../../../Authantication/domain/use_cases/get_user_uc.dart';
import '../../../../../Authantication/domain/use_cases/login_uc.dart';
import '../../../../../Authantication/domain/use_cases/verify_forget_password_uc.dart';

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
                    DefaultSelectableText("مرحباً", style: TextStyle(
                        color: ColorManager.myGrayLite,
                        fontWeight: FontWeight.bold)),
                    SizedBox(width: 10,),
                    DefaultSelectableText(
                        AuthanticationCubit.userModel?.name ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }
          else if (state is GetUserLoading) {
            return CircularProgressIndicator();
          }
          else {
            return DefaultTextButton(title: "تسجيل الدخول",
              onPressed: () => context.go(RoutesManager.loginScreen),);
          }
        });
  }
}