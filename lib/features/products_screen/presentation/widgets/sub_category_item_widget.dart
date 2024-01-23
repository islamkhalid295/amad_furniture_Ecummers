import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({super.key, required this.title, this.onPressed});
final String title;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextButton(
        style: ButtonStyle(alignment: Alignment.centerRight),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
