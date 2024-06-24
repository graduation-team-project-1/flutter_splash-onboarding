import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/eddit_mood_view_body.dart';
import 'package:flutter/material.dart';

class EditMoodView extends StatelessWidget {
  const EditMoodView({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return EditMoodViewBody(
      eventModel: eventModel,
    );
  }
}
