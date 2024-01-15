import 'package:flutter/material.dart';

import '../../../../../../../core/utils/color_manager.dart';
import '../../../my_widget.dart';

class DefaultTextFormField extends StatelessWidget {

  const DefaultTextFormField({super.key, this.title, this.hintText, this.icon, this.suffixIcon, this.maxLines, this.width, this.height, this.boxShape, this.validator, this.controller});
final String? title;
final String? hintText;
final Icon? icon;
final Icon? suffixIcon;
final int? maxLines;
final double? width;
final double? height;
final BoxShape? boxShape;
final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: title != null ? DefaultSelectableText(
              title!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ) : null,
          ),
          Container(
            width: width ?? 300,
            height: height,
            decoration: BoxDecoration(
                color: ColorManager.myGrayLiteMore,
                border: Border.all(color: ColorManager.myGrayLite,),
                borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextFormField(
                controller: controller,
                validator: validator /*(value) {
                  if (value!.isEmpty) {
                    return 'name can\'t be empty';
                  } else {
                    return null;
                  }
                }*/,
                decoration: InputDecoration(
errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  hintStyle: TextStyle(
                      fontSize: 14, color: ColorManager.myGrayLite),
                  border: InputBorder.none,
                  hintText: hintText,
                  icon: icon,
                  suffixIcon: suffixIcon,
                ),
                maxLines: maxLines,
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
