import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/custom_snackbar.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/pregnancy_development_cubit/pregnancy_development_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/pregnant_home_view.dart';
import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:app/features/profile/data/repo/change_pregnancy_profile_data_api.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:app/features/profile/presentation/view/widgets/change_password_button.dart';
import 'package:app/features/profile/presentation/view/widgets/pick_due_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    Key? key,
    this.child,
    required this.onTab,
    required this.pregnancyProfileModel,
    required this.selectedImage,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback onTab;
  final PregnancyProfileModel pregnancyProfileModel;
  final String? selectedImage;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, phoneNumber, dueDate;
  DateTime? selectedDate;
  String? dueDateError;
  String? initialDueDate;

  @override
  void initState() {
    super.initState();
    initialDueDate = widget.pregnancyProfileModel.user?.pregnant?.dueDate ??
        widget.pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ??
        widget.pregnancyProfileModel.user?.pregnant?.dateOfConception ??
        '';
    dueDate = initialDueDate;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: ListView(
        children: [
          const VerticalSpace(3),
          GestureDetector(
            onTap: widget.onTab,
            child: widget.child,
          ),
          const VerticalSpace(3),
          _buildNameField(),
          const VerticalSpace(1),
          _buildPhoneNumberField(),
          const VerticalSpace(1),
          const ChangePasswordButton(),
          const VerticalSpace(1.5),
          _buildDueDatePicker(),
          if (dueDateError != null) _buildDueDateError(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(StringManager.dateFormat),
          ),
          const VerticalSpace(2),
          _buildSaveChangesButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextFormFieldWithoutBackground(
      hintText: StringManager.name,
      borderRadius: 10,
      onSaved: (value) => name = value,
      initialValue: widget.pregnancyProfileModel.user?.name!,
    );
  }

  Widget _buildPhoneNumberField() {
    return CustomTextFormFieldWithoutBackground(
      hintText: StringManager.phoneNumber,
      borderRadius: 10,
      onSaved: (value) => phoneNumber = value,
      validator: (value) {
        if (value!.isNotEmpty && int.tryParse(value) == null) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      initialValue:
          widget.pregnancyProfileModel.user?.phoneNumber.toString() == 'null'
              ? '0'
              : widget.pregnancyProfileModel.user?.phoneNumber.toString(),
    );
  }

  Widget _buildDueDatePicker() {
    return PickDueDate(
      onDateSelected: (date) {
        if (_validateDueDate(date)) {
          setState(() {
            selectedDate = date;
            dueDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
            dueDateError = null;
          });
        } else {
          setState(() {
            dueDateError = 'Due date cannot be in the future.';
          });
        }
      },
      initialValue: widget.pregnancyProfileModel.user?.pregnant?.dueDate ??
          widget.pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ??
          widget.pregnancyProfileModel.user?.pregnant?.dateOfConception ??
          '',
    );
  }

  Widget _buildDueDateError() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        dueDateError!,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildSaveChangesButton() {
    return CustomButton(
      buttonTitle: StringManager.saveChanges,
      onPressed: dueDateError == null ? _onSaveChanges : null,
    );
  }

  bool _validateDueDate(DateTime date) {
    return date.isBefore(DateTime.now()) ||
        date.isAtSameMomentAs(DateTime.now());
  }

  Future<void> _onSaveChanges() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      selectedDate = selectedDate ?? DateTime.parse(initialDueDate!);

      if (_validateDueDate(selectedDate!)) {
        final result = await ChangePregnantInfo().changePregnantInfo(
          bearerToken: StringManager.bearerToken,
          name: name ?? widget.pregnancyProfileModel.user?.name ?? '',
          dueDate: dueDate ??
              widget.pregnancyProfileModel.user?.pregnant?.dueDate ??
              widget
                  .pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ??
              widget.pregnancyProfileModel.user?.pregnant?.dateOfConception ??
              '',
          phoneNumber: phoneNumber ??
              widget.pregnancyProfileModel.user?.phoneNumber ??
              0,
          profilePicturePath: widget.selectedImage ??
              widget.pregnancyProfileModel.user?.profilePicture ??
              '',
        );

        _handleResult(result);
      } else {
        setState(() {
          dueDateError = 'Due date cannot be in the future.';
        });
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void _handleResult(Map<String, dynamic>? result) {
    if (result != null) {
      if (result['success']) {
        CustomSnackBar.show(context, 'Profile updated successfully');
        _updateProfileData();
        _navigateToHomeView();
      } else {
        _showErrorMessages(result);
      }
    } else {
      CustomSnackBar.show(context, 'An error occurred',
          backgroundColor: ColorManager.redColor);
    }
  }

  void _updateProfileData() {
    const bearerToken = StringManager.bearerToken;
    BlocProvider.of<PregnancyProfileCubit>(context)
        .fetchPregnantProfileData(bearerToken: bearerToken);
    BlocProvider.of<PregnancyDevelopmentCubit>(context)
        .fetchPregnancyDevelopmentInfo(
      bearerToken: bearerToken,
      week: StringManager().calculatePregnancyDetails(dueDate!)[1] ?? 5,
    );
  }

  void _navigateToHomeView() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const PregnantHomeView()),
      (Route<dynamic> route) => false,
    );
  }

  void _showErrorMessages(Map<String, dynamic> result) {
    CustomSnackBar.show(context, result['message'],
        backgroundColor: ColorManager.redColor);
    if (result['errors'] != null) {
      result['errors'].forEach((field, error) {
        CustomSnackBar.show(context, 'Field: $field, Error: $error',
            backgroundColor: ColorManager.redColor);
      });
    }
  }
}
