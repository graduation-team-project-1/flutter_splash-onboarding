import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    this.content,
    required this.onConfirm,
    required this.onCancel,
    this.titleTextAlign,
  }) : super(key: key);

  final String title;
  final Widget? content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final TextAlign? titleTextAlign;

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorManager.whiteColor,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.5 * SizeConfig.defaultSize!,
            horizontal: 2 * SizeConfig.defaultSize!,
          ),
          child: Text(
            text,
            style: const TextStyle(color: ColorManager.whiteColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: ColorManager.shadowColor,
      backgroundColor: ColorManager.mainColor,
      title: Text(
        title,
        textAlign: titleTextAlign ?? TextAlign.start,
        style: const TextStyle(color: ColorManager.whiteColor),
      ),
      content: content,
      actions: <Widget>[
        _buildActionButton("No", onCancel),
        _buildActionButton("Yes", onConfirm),
      ],
    );
  }
}
