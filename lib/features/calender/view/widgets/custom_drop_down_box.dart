import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownBox extends StatefulWidget {
  const CustomDropDownBox(
      {super.key,
      required this.options,
      required this.label,
      required this.onValueChanged,
      required this.selectedValue});

  final List<String> options;
  final String label;
  final String selectedValue;
  final void Function(String) onValueChanged;

  @override
  State<CustomDropDownBox> createState() => _CustomDropDownBoxState();
}

class _CustomDropDownBoxState extends State<CustomDropDownBox> {
  late String selectedValue;
  @override
  void initState() {
    super.initState();
    // print('Selected value in initState: ${widget.selectedValue}');

    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: selectedValue,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorManager.mainColor,
      ),
      items: widget.options.map<DropdownMenuItem<String>>((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(
            option,
            style: Styles.textStyle14.copyWith(
                color: ColorManager.barColor, fontFamily: FontType.kRoboto),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue ?? widget.options[0];
        });
        widget.onValueChanged(selectedValue);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        labelText: widget.label,
        labelStyle: Styles.textStyle14.copyWith(
          color: ColorManager.mainColor,
          fontFamily: FontType.kRoboto,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? ColorManager.mainColor),
    );
  }
}
