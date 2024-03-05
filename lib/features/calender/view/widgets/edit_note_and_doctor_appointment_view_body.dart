import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/calender/view/widgets/custom_date_and_time_picker_overllay.dart';
import 'package:flutter/material.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/current_date_and_time.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:app/features/calender/view/widgets/custom_time_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteAndDoctorAppointmentViewBody extends StatefulWidget {
  const EditNoteAndDoctorAppointmentViewBody(
      {Key? key, required this.eventModel})
      : super(key: key);
  final EventModel eventModel;

  @override
  State<EditNoteAndDoctorAppointmentViewBody> createState() =>
      _EditNoteAndDoctorAppointmentViewBodyState();
}

class _EditNoteAndDoctorAppointmentViewBodyState
    extends State<EditNoteAndDoctorAppointmentViewBody> {
  String? title, content;
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
                        BlocProvider.of<EventsCubit>(context).fetchAllEvents();
                        Navigator.pop(context);
                      },
                    ),
                    const VerticalSpace(1),
                    const CurrentDateAndTime(),
                    const VerticalSpace(1.5),
                    CustomTextFormFieldWithBackground(
                      hintText: widget.eventModel.title,
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    const VerticalSpace(1),
                    CustomTextFormFieldWithBackground(
                      hintText: widget.eventModel.content,
                      maxLines: 12,
                      onChanged: (value) {
                        content = value;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child:
                          Divider(color: ColorManager.mainColor, thickness: 3),
                    ),
                    CustomDateAndTimeCart(
                      checked: widget.eventModel.isNotification,
                      onTap: handleCustomDateandTimeCartTap,
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
                    ),
                    const VerticalSpace(1.5),
                    CustomButton(
                      buttonTitle: "Save",
                      onPressed: () {
                        widget.eventModel.content =
                            content ?? widget.eventModel.content;
                        widget.eventModel.title =
                            title ?? widget.eventModel.title;
                        widget.eventModel.isNotification =
                            isNotification ?? widget.eventModel.isNotification;
                        if (selectedDateAndTime != null) {
                          widget.eventModel.dateOfNotification =
                              selectedDateAndTime.toString();
                        }
                        print(
                            '#final dateOfNotification: ${widget.eventModel.dateOfNotification}');

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
