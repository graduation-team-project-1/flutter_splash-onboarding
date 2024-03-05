import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/calender/cubits/add_events_cubit/add_event_cubit.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/add_doctor_appointment_form.dart';
import 'package:app/features/calender/view/widgets/custom_date_and_time_picker_overllay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DoctorAppointmentViewBody extends StatefulWidget {
  const DoctorAppointmentViewBody({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentViewBody> createState() =>
      _DoctorAppointmentViewBodyState();
}

class _DoctorAppointmentViewBodyState extends State<DoctorAppointmentViewBody> {
  bool smoothingBackground = false;
  DateTime? selectedDateandTime;

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
              child: BlocConsumer<AddEventCubit, AddEventState>(
                listener: (context, state) {
                  if (state is AddEventSuccess) {
                    BlocProvider.of<EventsCubit>(context).fetchAllEvents();
                    Navigator.pop(context);
                  } else if (state is AddEventFailure) {
                    print(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    color: ColorManager.blurredBackgroundColor,
                    opacity: .7,
                    inAsyncCall: state is AddEventLoading ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AddDoctorAppointmentForm(
                        selectedDateandTime:
                            selectedDateandTime ?? DateTime.now(),
                        onTap: handleCustomDateandTimeCartTap,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (smoothingBackground)
            CustomDatePickerOverlay(
              handleBackgroundTap: _handleBackgroundTap,
              handleDateTimeChanged: (value) {
                setState(() {
                  selectedDateandTime = value;
                });
              },
            ),
        ],
      ),
    );
  }
}
