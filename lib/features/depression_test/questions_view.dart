import 'package:app/features/depression_test/widgets/questions_view_body.dart';
import 'package:flutter/material.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key, required this.isBoy});
  final bool isBoy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionsViewBody(isBoy: isBoy),
    );
  }
}
