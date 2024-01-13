import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../my_widget.dart';

class ShopCart extends StatelessWidget {
  const ShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.myYellow),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.cart,
                  size: 30,
                )),
            CircleAvatar(
              child: DefaultSelectableText(
                "1",
                style: TextStyle(color: ColorManager.myWhite),
              ),
              backgroundColor: Colors.red,
              radius: 10,
            ),
          ],
        ));
  }
}
