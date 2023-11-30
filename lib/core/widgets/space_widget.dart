import 'package:app/core/resource/size_config.dart';
import 'package:flutter/material.dart';

class HorizintalSpace extends StatelessWidget {
  const HorizintalSpace(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defultSize! * value!,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          SizeConfig.defultSize != null ? SizeConfig.defultSize! * value! : 0,
    );
  }
}
