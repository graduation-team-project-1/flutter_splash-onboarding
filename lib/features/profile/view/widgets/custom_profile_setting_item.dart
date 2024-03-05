import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomProfileSettingItem extends StatelessWidget {
  const CustomProfileSettingItem(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.trailing,
      this.onTab,
      this.leading,
      this.textColor});
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: ShapeDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            )),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: Styles.textStyle14.copyWith(
                fontFamily: FontType.kRoboto,
                color: textColor ?? ColorManager.barColor),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
