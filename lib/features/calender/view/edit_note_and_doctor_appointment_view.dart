import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/edit_note_and_doctor_appointment_view_body.dart';
import 'package:flutter/material.dart';

class EditNoteAndDoctorAppointmentView extends StatelessWidget {
  const EditNoteAndDoctorAppointmentView({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return EditNoteAndDoctorAppointmentViewBody(
      eventModel: eventModel,
    );
  }
}
