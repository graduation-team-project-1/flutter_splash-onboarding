import 'package:flutter/material.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  bool isVisibleCurrentPassword = false;
  bool isVisibleNewPassword = false;
  bool isVisibleConfirmPassword = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? newPassword, confirmPassword, currentPassword;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget buildPasswordField({
    required String hintText,
    required bool isVisible,
    required ValueChanged<bool> onChanged,
    required void Function(String?)? onSaved,
    String? Function(String?)? validator,
  }) {
    return CustomTextFormFieldWithoutBackground(
      hintText: hintText,
      obscureText: !isVisible,
      onSaved: onSaved,
      validator: validator,
      borderRadius: 4,
      trailingIcon: IconButton(
        onPressed: () => onChanged(!isVisible),
        icon: isVisible
            ? const Icon(
                Icons.visibility_outlined,
                color: ColorManager.mainColor,
              )
            : const Icon(
                Icons.visibility_off_outlined,
                color: ColorManager.mainColor,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(
          iconColor: ColorManager.mainColor,
          title: StringManager.changePassword,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const VerticalSpace(2),
              buildPasswordField(
                hintText: StringManager.currentPassword,
                isVisible: isVisibleCurrentPassword,
                onChanged: (value) {
                  setState(() {
                    isVisibleCurrentPassword = value;
                  });
                },
                onSaved: (value) {
                  currentPassword = value;
                },
              ),
              const VerticalSpace(1),
              buildPasswordField(
                hintText: StringManager.newPassword,
                isVisible: isVisibleNewPassword,
                onChanged: (value) {
                  setState(() {
                    isVisibleNewPassword = value;
                  });
                },
                onSaved: (value) {
                  newPassword = value;
                },
                validator: _validatePassword,
              ),
              const VerticalSpace(1),
              buildPasswordField(
                hintText: StringManager.confirmPassword,
                isVisible: isVisibleConfirmPassword,
                onChanged: (value) {
                  setState(() {
                    isVisibleConfirmPassword = value;
                  });
                },
                onSaved: (value) {
                  confirmPassword = value;
                },
                validator: _validateConfirmPassword,
              ),
              const Spacer(flex: 5),
              CustomButton(
                buttonTitle: StringManager.saveChanges,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
