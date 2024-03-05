import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/current_date_and_time.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/calender/view/widgets/custom_multli_select_ship.dart';
import 'package:app/features/calender/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMoodViewBody extends StatefulWidget {
  const EditMoodViewBody({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  State<EditMoodViewBody> createState() => _EditMoodViewBodyState();
}

class _EditMoodViewBodyState extends State<EditMoodViewBody> {
  List<String> selectedReportList = [];

  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const VerticalSpace(2),
          CustomAppBarWithDelete(
              title: widget.eventModel.type,
              deleteOnTap: () {
                widget.eventModel.delete();
                BlocProvider.of<EventsCubit>(context).fetchAllEvents();
                Navigator.pop(context);
              }),
          const VerticalSpace(2),
          const CurrentDateAndTime(),
          const VerticalSpace(2),
          MultiSelectChip(
            initialSelectedChoices: widget.eventModel.selectedMood,
            reportList: StringManager.moodList,
            onSelectionChanged: (selectedList) {
              setState(() {
                selectedReportList = selectedList;
              });
            },
          ),
          const VerticalSpace(1.5),
          CustomTextFormFieldWithBackground(
            hintText: widget.eventModel.title.isEmpty
                ? "Comments"
                : widget.eventModel.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const VerticalSpace(2),
          CustomButton(
              buttonTitle: "Save",
              onPressed: () {
                // print(widget.eventModel.title);

                if (selectedReportList.isEmpty) {
                  selectedReportList = widget.eventModel.selectedMood;
                }
                widget.eventModel.selectedMood = selectedReportList;
                widget.eventModel.title = title ?? widget.eventModel.title;
                widget.eventModel.save();
                BlocProvider.of<EventsCubit>(context).fetchAllEvents();
                Navigator.pop(context);
              })
        ],
      ),
    ));
  }
}
