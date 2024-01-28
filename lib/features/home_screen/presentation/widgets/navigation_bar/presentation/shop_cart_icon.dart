import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../../../cart_screen/presentation/manager/cart_cubit.dart';

class ShopCart extends StatelessWidget {
  const ShopCart( {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.myYellow),
            borderRadius: BorderRadius.circular(10)),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.cart,
                      size: 30,
                    )),
                CartCubit.cart.isNotEmpty ? CircleAvatar(
                  child: DefaultSelectableText(
                    CartCubit.cart.length.toString(),
                    style: TextStyle(color: ColorManager.myWhite),
                  ),
                  backgroundColor: Colors.red,
                  radius: 10,
                ) : SizedBox(),
              ],
            );
          },
        ));
  }
}
