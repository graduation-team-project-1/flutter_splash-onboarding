import 'package:app/features/calender/cubits/add_events_cubit/add_event_cubit.dart';
import 'package:app/features/calender/view/widgets/add_note_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddEventCubit(),
        child: const AddNoteViewBody(),
      ),
    );
  }
}
