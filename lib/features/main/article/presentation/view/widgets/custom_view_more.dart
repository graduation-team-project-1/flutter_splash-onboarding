import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomViewMore extends StatelessWidget {
  const CustomViewMore({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Row(
        children: [
          Text(
            "View all",
            style: Styles.textStyle24.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorManager.pinkColor,
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: ColorManager.pinkColor,
          ),
        ],
      ),
    );
  }
}
