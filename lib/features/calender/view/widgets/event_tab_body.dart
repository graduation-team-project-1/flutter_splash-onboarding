import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/custom_speed_dial.dart';
import 'package:app/features/calender/view/widgets/event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventTabBody extends StatefulWidget {
  const EventTabBody({super.key});

  @override
  State<EventTabBody> createState() => _EventTabBodyState();
}

class _EventTabBodyState extends State<EventTabBody> {
  @override
  void initState() {
    BlocProvider.of<EventsCubit>(context).fetchAllEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(child: EventListView()),
        ]),
        floatingActionButton: CustomSpeedDial(),
      ),
    );
  }
}
