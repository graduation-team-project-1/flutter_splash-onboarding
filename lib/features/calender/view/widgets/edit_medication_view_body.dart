import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/calender/view/widgets/custom_drop_down_box.dart';
import 'package:flutter/material.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/custom_date_and_time_picker_overllay.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/current_date_and_time.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:app/features/calender/view/widgets/custom_time_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMedicationViewBody extends StatefulWidget {
  const EditMedicationViewBody({Key? key, required this.eventModel})
      : super(key: key);
  final EventModel eventModel;

  @override
  State<EditMedicationViewBody> createState() => _EditMedicationViewBodyState();
}

class _EditMedicationViewBodyState extends State<EditMedicationViewBody> {
  String? name,
      typeOfMedication,
      dosage,
      numberOfTimesDay,
      diet,
      dateOfNotification;
  bool? isNotification;
  bool smoothingBackground = false;
  DateTime? selectedDateAndTime;

  void _handleBackgroundTap() {
    if (smoothingBackground) {
      setState(() {
        smoothingBackground = false;
      });
    }
  }

  void handleCustomDateandTimeCartTap() {
    setState(() {
      smoothingBackground = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: _handleBackgroundTap,
            child: AnimatedOpacity(
              opacity: smoothingBackground ? 0.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const VerticalSpace(2),
                    CustomAppBarWithDelete(
                        title: widget.eventModel.type,
                        deleteOnTap: () {
                          widget.eventModel.delete();
                          BlocProvider.of<EventsCubit>(context)
                              .fetchAllEvents();
                          Navigator.pop(context);
                        }),
                    const VerticalSpace(1),
                    const CurrentDateAndTime(),
                    const VerticalSpace(2),
                    CustomTextFormFieldWithoutBackground(
                      hintText: widget.eventModel.title,
                      onChanged: (value) {
                        name = value;
                      },
                      labelText: "Name",
                    ),
                    const VerticalSpace(1.5),
                    CustomDropDownBox(
                      selectedValue: typeOfMedication ??
                          widget.eventModel.typeOfMedication,
                      options: StringManager.typeMedication,
                      label: "Type",
                      onValueChanged: (selectedType) {
                        setState(() {
                          typeOfMedication = selectedType;
                        });
                        // print('typeOfMedication: ${typeOfMedication}');
                        // print('typeOfMedication in Model: ${widget.eventModel.typeOfMedication}');
                      },
                    ),
                    const VerticalSpace(1.5),
                    CustomTextFormFieldWithoutBackground(
                      hintText: widget.eventModel.dosage,
                      onChanged: (value) {
                        dosage = value;
                      },
                      labelText: "Dosage",
                    ),
                    const VerticalSpace(1.5),
                    CustomTextFormFieldWithoutBackground(
                      hintText: widget.eventModel.numberOfTimesADay,
                      onChanged: (value) {
                        numberOfTimesDay = value;
                      },
                      labelText: "Number of times a day",
                    ),
                    const VerticalSpace(1.5),
                    CustomDropDownBox(
                      selectedValue: diet ?? widget.eventModel.diet,
                      options: StringManager.dietMedication,
                      label: "Diet",
                      onValueChanged: (selectedType) {
                        if (selectedType != widget.eventModel.diet) {
                          setState(() {
                            diet = selectedType;
                          });
                        }
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child:
                          Divider(color: ColorManager.mainColor, thickness: 3),
                    ),
                    CustomDateAndTimeCart(
                      onTap: handleCustomDateandTimeCartTap,
                      // selectedDateAndTime:
                      //     isNotification ?? widget.eventModel.isNotification
                      //         ? selectedDateAndTime ?? DateTime.now()
                      //         : DateTime.parse(
                      //             widget.eventModel.dateOfNotification),
                      selectedDateAndTime: selectedDateAndTime ??
                          DateTime.parse(widget.eventModel.dateOfNotification),
                      onCheckedChanged: (value) {
                        setState(() {
                          isNotification = value;

                          if (!value) {
                            selectedDateAndTime = DateTime.parse(
                                widget.eventModel.dateOfNotification);
                          }
                        });
                      },
                      checked: widget.eventModel.isNotification,
                    ),
                    const VerticalSpace(1.5),
                    CustomButton(
                      buttonTitle: "Save",
                      onPressed: () {
                        widget.eventModel.title =
                            name ?? widget.eventModel.title;

                        widget.eventModel.typeOfMedication =
                            typeOfMedication != StringManager.typeMedication[0]
                                ? (typeOfMedication ??
                                    widget.eventModel.typeOfMedication)
                                : StringManager.typeMedication[0];

                        widget.eventModel.isNotification =
                            isNotification ?? widget.eventModel.isNotification;

                        if (selectedDateAndTime != null) {
                          widget.eventModel.dateOfNotification =
                              selectedDateAndTime.toString();
                        }
                        print(
                            '#final dateOfNotification: ${widget.eventModel.dateOfNotification}');

                        widget.eventModel.dosage =
                            dosage ?? widget.eventModel.dosage;

                        widget.eventModel.numberOfTimesADay =
                            numberOfTimesDay ??
                                widget.eventModel.numberOfTimesADay;

                        widget.eventModel.diet =
                            diet != StringManager.dietMedication[0]
                                ? (diet ?? widget.eventModel.diet)
                                : StringManager.dietMedication[0];

                        widget.eventModel.save();
                        BlocProvider.of<EventsCubit>(context).fetchAllEvents();
                        Navigator.pop(context);
                      },
                    ),
                    const VerticalSpace(1),
                    CustomButton(
                      buttonTitle: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: ColorManager.switchIconColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (smoothingBackground)
            CustomDatePickerOverlay(
              handleBackgroundTap: _handleBackgroundTap,
              handleDateTimeChanged: (value) {
                setState(() {
                  selectedDateAndTime = value;
                });
              },
            ),
        ],
      ),
    );
  }
}
