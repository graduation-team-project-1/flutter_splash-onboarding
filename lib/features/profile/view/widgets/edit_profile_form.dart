import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/string_manage.dart';

import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';

import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';

import 'package:app/features/profile/view/widgets/change_password_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    super.key,
    this.child,
    required this.onTab,
  });
  final Widget? child;
  final VoidCallback onTab;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: ListView(children: [
        const VerticalSpace(1),
        GestureDetector(
          onTap: widget.onTab,
          child: widget.child,
        ),
        const VerticalSpace(2.5),
        CustomTextFormFieldWithoutBackground(
          hintText: StringManager.name,
          borderRadius: 10,
          onSaved: (value) {
            name = value;
          },
        ),
        const VerticalSpace(1),
        CustomTextFormFieldWithoutBackground(
          hintText: StringManager.email,
          borderRadius: 10,
          onSaved: (value) {
            email = value;
          },
        ),
        const VerticalSpace(1),
        CustomTextFormFieldWithoutBackground(
          hintText: StringManager.phoneNumber,
          borderRadius: 10,
          onSaved: (value) {
            phoneNumber = value;
          },
        ),
        const VerticalSpace(1),
        const ChangePasswordColor(),
        const VerticalSpace(1.5),
        CustomTextFormFieldWithoutBackground(
          hintText: StringManager.phoneNumber,
          borderRadius: 5,
          labelText: StringManager.dueDate,
          trailingIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ImagesPath.calenderShape)),
          borderWidth: 2,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(StringManager.dateFormat),
        ),
        const VerticalSpace(2),
        CustomButton(
            buttonTitle: StringManager.saveChanges,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            })
      ]),
    );
  }
}
