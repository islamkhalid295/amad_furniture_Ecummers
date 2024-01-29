import 'package:amad_furniture/core/utils/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/locator.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../../../cart_screen/presentation/manager/cart_cubit.dart';

class ShopCart extends StatelessWidget {
  const ShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.myYellow),
            borderRadius: BorderRadius.circular(10)),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            CartCubit cartCubit = BlocProvider.of(context);
            // if ((token != null && token != 'null') && CartCubit.cart.isEmpty &&
            //     state is! GetCartLoading) {
            //   cartCubit.getCart();
            // }
            return Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.cart,
                      size: 30,
                    )),
                state is GetCartLoading  ? CircleAvatar(
                  child: CircularProgressIndicator(color: ColorManager.myYellow,),
                  backgroundColor: Colors.red,
                  radius: 10,) : CartCubit.cart != null ? CartCubit.cart!.isNotEmpty ? CircleAvatar(
                  child: DefaultSelectableText(
                    CartCubit.cart!.length.toString(),
                    style: TextStyle(color: ColorManager.myWhite),
                  ),
                  backgroundColor: Colors.red,
                  radius: 10,
                ) : SizedBox() : SizedBox(),
              ],
            );
          },
        ));
  }
}
