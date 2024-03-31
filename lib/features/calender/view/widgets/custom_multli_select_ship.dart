import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  const MultiSelectChip({
    super.key,
    required this.reportList,
    required this.onSelectionChanged,
    required this.initialSelectedChoices,
  });
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  final List<String> initialSelectedChoices;
  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];
  @override
  void initState() {
    super.initState();
    selectedChoices =
        widget.initialSelectedChoices; // Set initial selected choices
  }

  List<Widget> _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.reportList) {
      choices.add(
        ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          showCheckmark: false,
          onSelected: (selected) {
            setState(
              () {
                if (selectedChoices.length < 3 ||
                    selectedChoices.contains(item)) {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                  widget.onSelectionChanged(selectedChoices);
                }
              },
            );
          },
          backgroundColor: selectedChoices.contains(item)
              ? ColorManager.whiteColor
              : ColorManager.mainColor,
          selectedColor: ColorManager.whiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorManager.mainColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: Styles.textStyle16.copyWith(
            fontFamily: FontType.kRoboto,
            color: selectedChoices.contains(item)
                ? ColorManager.mainColor
                : ColorManager.whiteColor,
          ),
        ),
      );
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 13,
      children: _buildChoiceList(),
    );
  }
}
