import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/edit_medication_view_body.dart';
import 'package:flutter/material.dart';

class EditMedicationView extends StatelessWidget {
  const EditMedicationView({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return EditMedicationViewBody(
      eventModel: eventModel,
    );
  }
}
