import 'package:cedage/core/utils/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../cart_screen/presentation/manager/cart_cubit.dart';

class ShopCart extends StatelessWidget {
  const ShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(10)),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            // if ((token != null && token != 'null') && CartCubit.cart.isEmpty &&
            //     state is! GetCartLoading) {
            //   cartCubit.getCart();
            // }
            return Stack(
              children: [
                IconButton(

                  iconSize:  22 ,
                    onPressed: () {
                      context.go(RoutesManager.cartScreen);
                    },
                    icon:  const Icon(
                      CupertinoIcons.cart,
                    )),
                state is GetCartLoading  ?  CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10 * MediaQuery.of(context).size.width / 940,
                  child: const CircularProgressIndicator(color: ColorManager.primary,),) : CartCubit.cart != null ? CartCubit.cart!.isNotEmpty ? CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(
                    CartCubit.cartModel!.cart!.products!.length.toString(),
                    style: const TextStyle(color: ColorManager.myWhite),
                  ),
                ) : const SizedBox() : const SizedBox(),
              ],
            );
          },
        ));
  }
}
