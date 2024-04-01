import 'package:cedage/core/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({super.key, required this.questions, required this.answer});

  final String questions;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(),
      leading: Icon(Icons.mark_chat_read_outlined),
      title: Text(questions),
      childrenPadding: EdgeInsets.all(0),

      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorManager.myOffWhite,

                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(answer,textAlign: TextAlign.right),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
