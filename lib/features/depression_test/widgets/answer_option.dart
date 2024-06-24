import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.isBoy,
    super.key,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isBoy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: ShapeDecoration(
          color: isBoy
              ? ColorManager.boyColor.withOpacity(0.2)
              : ColorManager.girlColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: isSelected ? 3 : 1,
              color: isBoy ? ColorManager.boyColor : ColorManager.girlColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                text,
                style: Styles.robotoTextStyle16.copyWith(
                  color: isBoy ? ColorManager.boyColor : ColorManager.girlColor,
                ),
              ),
              const Spacer(),
              Icon(
                size: 30,
                isSelected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                color: isBoy ? ColorManager.boyColor : ColorManager.girlColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
