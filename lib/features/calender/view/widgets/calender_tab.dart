import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/custom_speed_dial.dart';
import 'package:app/features/calender/view/widgets/notification_events_list_view.dart';
import 'package:app/features/profile/data/models/pregnancy_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key, required this.pregnancyProfileCubit});
  final PregnancyProfileModel pregnancyProfileCubit;
  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;
  int? currentWeek;
  // Calculate the range of weeks

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventsCubit>(context).fetchAllEvents();
    super.initState();
    rangeStart = DateTime.parse(widget.pregnancyProfileCubit.dueDate ?? '');
    rangeEnd = rangeStart?.add(const Duration(days: 280));
  }

  void onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Due Date: ${widget.pregnancyProfileCubit.dueDate ?? ''}');
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: ColorManager.inpuDecorationColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: ColorManager.mainColor,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 10),
            lastDay: DateTime.utc(2035, 10, 10),
            availableGestures: AvailableGestures.all,
            onDaySelected: onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
            rangeStartDay: rangeStart,
            rangeEndDay: rangeEnd,
            calendarBuilders: CalendarBuilders(
              rangeHighlightBuilder: (context, day, isWithinRange) {
                if (isWithinRange) {
                  int? weekNumber = StringManager().calculatePregnancyDetails(
                      widget.pregnancyProfileCubit.dueDate ?? '')[1];
                  // Calculate the start and end of the current week
                  DateTime startOfWeek =
                      rangeStart!.add(Duration(days: (weekNumber!) * 7));
                  DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

                  // Check if the day is within the current week
                  bool isCurrentWeek = day.isAfter(
                          startOfWeek.subtract(const Duration(days: 1))) &&
                      day.isBefore(endOfWeek.add(const Duration(days: 1)));

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isCurrentWeek
                          ? ColorManager.calenderRangeColor
                          : weekNumber == currentWeek
                              ? ColorManager.whiteColor
                              : null,
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
          const Expanded(child: NotificationEventListView())
        ],
      ),
      floatingActionButton: const CustomSpeedDial(),
    );
  }
}
