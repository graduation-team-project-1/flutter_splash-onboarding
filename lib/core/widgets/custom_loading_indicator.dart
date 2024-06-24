import 'package:app/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.lodaigngIndicatorColor});
  final Color? lodaigngIndicatorColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: lodaigngIndicatorColor ?? ColorManager.mainColor,
      ),
    );
  }
}
