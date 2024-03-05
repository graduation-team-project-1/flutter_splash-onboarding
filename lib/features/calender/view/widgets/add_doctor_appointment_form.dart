import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/cubits/add_events_cubit/add_event_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:app/features/calender/view/widgets/custom_time_cart.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/current_date_and_time.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddDoctorAppointmentForm extends StatefulWidget {
  const AddDoctorAppointmentForm({
    super.key,
    required this.selectedDateandTime,
    required this.onTap,
  });
  final DateTime selectedDateandTime;
  final VoidCallback onTap;

  @override
  State<AddDoctorAppointmentForm> createState() =>
      _AddDoctorAppointmentFormState();
}

class _AddDoctorAppointmentFormState extends State<AddDoctorAppointmentForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  String formattedDate = StringManager().getCurrentFormattedDate();
  bool isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: ListView(
        shrinkWrap: true,
        children: [
          const VerticalSpace(2),
          const CustomAppBar(title: StringManager.kDoctorAppointment),
          const VerticalSpace(2),
          const CurrentDateAndTime(),
          const VerticalSpace(2),
          CustomTextFormFieldWithBackground(
            hintText: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const VerticalSpace(1),
          CustomTextFormFieldWithBackground(
            hintText: "Enter your note here",
            maxLines: 12,
            onSaved: (value) {
              content = value;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: ColorManager.mainColor, thickness: 3),
          ),
          CustomDateAndTimeCart(
            checked: isNotification,
            onTap: widget.onTap,
            selectedDateAndTime: widget.selectedDateandTime,
            onCheckedChanged: (value) {
              setState(() {
                isNotification = value;
              });
            },
          ),
          const VerticalSpace(2),
          CustomButton(
              buttonTitle: "Save",
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat('HH:mm dd MMMM y').format(currentDate);

                  var eventModel = EventModel(
                      content: content!,
                      date: formattedCurrentDate,
                      dateOfNotification: widget.selectedDateandTime.toString(),
                      title: title!,
                      isNotification: isNotification,
                      type: StringManager.kDoctorAppointment);
                  BlocProvider.of<AddEventCubit>(context).addevent(eventModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }),
          const VerticalSpace(1),
        ],
      ),
    );
  }
}
