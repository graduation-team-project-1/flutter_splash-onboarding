import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/main/more/data/local/baby_names_local.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/letters_and_names_values.dart';
import 'package:flutter/material.dart';

class BabyNameTitlesItems extends StatelessWidget {
  const BabyNameTitlesItems({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final letters = BabiesName().letters;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: letters
              .map(
                (e) => LetterAndNamesValue(
                  letter: e,
                  color: index == 0
                      ? ColorManager.boyBabyName
                      : index == 1
                          ? ColorManager.girlBabyName
                          : Colors.amber,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
