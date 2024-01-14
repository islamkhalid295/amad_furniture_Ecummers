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
        Text(answer,textAlign: TextAlign.right),
      ],
    );
  }
}
