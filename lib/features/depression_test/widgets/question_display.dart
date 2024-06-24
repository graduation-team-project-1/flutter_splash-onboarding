import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/depression_test/widgets/answer_option.dart';
import 'package:flutter/material.dart';

class QuestionDisplay extends StatelessWidget {
  final String question;
  final List<String> answers;
  final String selectedAnswer;
  final Function(String) onSelectAnswer;
  final bool isBoy;

  const QuestionDisplay({
    super.key,
    required this.question,
    required this.answers,
    required this.selectedAnswer,
    required this.onSelectAnswer,
    required this.isBoy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: Styles.textStyle24.copyWith(
              color: isBoy ? ColorManager.boyColor : ColorManager.girlColor,
              fontFamily: FontType.kInter,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...answers
            .map((answer) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AnswerOption(
                    isBoy: isBoy,
                    text: answer,
                    isSelected: selectedAnswer == answer,
                    onTap: () => onSelectAnswer(answer),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
