import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/cubits/add_events_cubit/add_event_cubit.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/current_date_and_time.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/calender/view/widgets/custom_multli_select_ship.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:app/features/calender/view/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MoodViewBody extends StatefulWidget {
  const MoodViewBody({Key? key}) : super(key: key);
  @override
  State<MoodViewBody> createState() => _MoodViewBodyState();
}

class _MoodViewBodyState extends State<MoodViewBody> {
  final _formKey = GlobalKey<FormState>();
  List<String> selectedReportList = [];
  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddEventCubit, AddEventState>(
        listener: (context, state) {
          if (state is AddEventFailure) {
            // Handle failure state
          }
          if (state is AddEventSuccess) {
            BlocProvider.of<EventsCubit>(context).fetchAllEvents();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: ColorManager.blurredBackgroundColor,
            opacity: .7,
            inAsyncCall: state is AddEventLoading ? true : false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const VerticalSpace(2),
                    const CustomAppBar(
                      title: StringManager.kMood,
                    ),
                    const VerticalSpace(2),
                    const CurrentDateAndTime(),
                    const VerticalSpace(2),
                    MultiSelectChip(
                      initialSelectedChoices: [],
                      reportList: StringManager.moodList,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedReportList = selectedList;
                        });
                      },
                    ),
                    const VerticalSpace(1.5),
                    CustomTextFormFieldWithBackground(
                      hintText: "Comments",
                      onSaved: (value) {
                        title = value;
                      },
                    ),
                    const VerticalSpace(2),
                    CustomButton(
                      buttonTitle: "Save",
                      onPressed: () {
                        try {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();

                            if (selectedReportList.isEmpty) {
                              throw Exception(
                                  "Please select at least one Mood...");
                            }

                            var currentDate = DateTime.now();
                            var formattedCurrentDate =
                                DateFormat('HH:mm dd MMMM y')
                                    .format(currentDate);

                            var eventModel = EventModel(
                              selectedMood: selectedReportList,
                              date: formattedCurrentDate,
                              title: title ?? "",
                              type: StringManager.kMood,
                              isNotification: false,
                            );

                            BlocProvider.of<AddEventCubit>(context)
                                .addevent(eventModel);
                            showSnackBar(context, "Mood added successfully");
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      },
                    ),
                    const VerticalSpace(1),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
