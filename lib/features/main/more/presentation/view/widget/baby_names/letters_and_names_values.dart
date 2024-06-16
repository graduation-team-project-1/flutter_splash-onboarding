
import 'package:app/features/main/more/presentation/view/widget/baby_names/babyies_names_values.dart';
import 'package:flutter/material.dart';

class LetterAndNamesValue extends StatelessWidget {
  const LetterAndNamesValue({
    super.key,
    required this.letter,
    required this.color,
  });
  final String letter;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          letter,
          style: TextStyle(color: color),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: BabyiesNamesValues(
            nameStratWith: letter,
            color: color,
          ),
        ),
      ],
    );
  }
}
