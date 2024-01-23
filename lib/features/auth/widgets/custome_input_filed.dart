// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:flutter/material.dart';

class CustomeInputFiled extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final bool? isPassword;

  const CustomeInputFiled({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.errorText,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomeInputFiled> createState() => _CustomeInputFiledState();
}

class _CustomeInputFiledState extends State<CustomeInputFiled> {
  String? errorMessage;
  bool notVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword! ? notVisible : false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: AppSizeManager.s1_5,
            color: ColorManager.mainColor,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeManager.s8,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: AppSizeManager.s1_5,
            color: ColorManager.mainColor,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeManager.s8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: AppSizeManager.s1_5,
            color: ColorManager.redColor,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeManager.s8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: AppSizeManager.s1_5,
            color: ColorManager.redColor,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeManager.s8,
          ),
        ),
        hintText: widget.hintText,
        errorText: errorMessage,
        suffixIcon: widget.isPassword!
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      notVisible = !notVisible;
                    },
                  );
                },
                icon: notVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
        suffixIconColor: ColorManager.mainColor,
        hintStyle: const TextStyle(color: ColorManager.grayColor),
      ),
      controller: widget.controller,
      onChanged: (newValue) {
        setState(() {
          if (newValue.isEmpty) {
            errorMessage = widget.errorText;
          } else {
            errorMessage = null;
          }
        });
      },
    );
  }
}
