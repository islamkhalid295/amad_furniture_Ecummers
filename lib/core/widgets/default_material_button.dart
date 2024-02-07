import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton(
      {super.key,
      required this.onPressed,
      this.lodingCondition = false,
      this.linearProgressIndicator = false,
      this.succsessCondition = false,
      this.errorCondition = false,
      required this.text,
      this.height = 45,
      this.minWidth = 310,
      this.borderRadius = 25,
      this.color,
      this.textColor,
      this.borderColor, this.fontSize});

  final VoidCallback onPressed;
  final bool lodingCondition;
  final bool linearProgressIndicator;
  final bool succsessCondition;
  final bool errorCondition;
  final String text;
  final double height;
  final double? minWidth;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;

  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color ?? ColorManager.myBlack,
      height: height,
      minWidth: minWidth,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
        side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
      ),
      child: lodingCondition
          ? linearProgressIndicator ? LinearProgressIndicator(color: ColorManager.myWhite,) : CircularProgressIndicator(
              color: ColorManager.myWhite,
            )
          : succsessCondition
              ? Icon(
                  Icons.done_outline_outlined,
                  color: ColorManager.myWhite,
                )
              : errorCondition
                  ? Icon(
                      Icons.refresh,
                      color: Colors.red,
                    )
                  : FittedBox(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor ?? ColorManager.myWhite,
                          fontSize: fontSize ?? 17.59,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
    );
  }
}
