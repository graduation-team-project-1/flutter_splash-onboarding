import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/cubits/add_events_cubit/add_event_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/custom_drop_down_box.dart';
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

class AddMedicationForm extends StatefulWidget {
  const AddMedicationForm({
    super.key,
    required this.selectedDateandTime,
    required this.onTap,
  });
  final DateTime selectedDateandTime;
  final VoidCallback onTap;

  @override
  State<AddMedicationForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddMedicationForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, typeOfMedication, dosage, numberOfTimesDay, diet;
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
          const CustomAppBar(title: StringManager.kMedication),
          const VerticalSpace(2),
          const CurrentDateAndTime(),
          const VerticalSpace(2),
          CustomTextFormFieldWithoutBackground(
            hintText: "Title",
            onSaved: (value) {
              name = value;
            },
          ),
          const VerticalSpace(1.5),
          CustomDropDownBox(
            selectedValue: StringManager.typeMedication[0],
            options: StringManager.typeMedication,
            label: "Type",
            onValueChanged: (selectedType) {
              typeOfMedication = selectedType;
            },
          ),
          const VerticalSpace(1.5),
          CustomTextFormFieldWithoutBackground(
            hintText: "1 pcs.",
            onSaved: (value) {
              dosage = value;
            },
            labelText: "Dosage",
          ),
          const VerticalSpace(1.5),
          CustomTextFormFieldWithoutBackground(
            hintText: "1",
            onSaved: (value) {
              numberOfTimesDay = value;
            },
            labelText: "Number of times a day",
          ),
          const VerticalSpace(1.5),
          CustomDropDownBox(
            selectedValue: StringManager.dietMedication[0],
            options: StringManager.dietMedication,
            label: "Diet",
            onValueChanged: (selectedType) {
              diet = selectedType;
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
                    title: name!,
                    date: formattedCurrentDate,
                    dateOfNotification: widget.selectedDateandTime.toString(),
                    diet: diet ?? StringManager.dietMedication[0],
                    isNotification: isNotification,
                    dosage: dosage!,
                    numberOfTimesADay: numberOfTimesDay!,
                    type: StringManager.kMedication,
                    typeOfMedication:
                        typeOfMedication ?? StringManager.typeMedication[0],
                  );

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
