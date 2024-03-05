// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/features/calender/models/event_model.dart';
// import 'package:app/features/calender/view/widgets/custom_speed_dial.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarTab extends StatefulWidget {
//   const CalendarTab({Key? key}) : super(key: key);

//   @override
//   State<CalendarTab> createState() => _CalendarTabState();
// }

// class _CalendarTabState extends State<CalendarTab> {
//   DateTime today = DateTime.now();
//   DateTime? rangeStart;
//   DateTime? rangeEnd;
//   // Calculate the range of weeks
//   int currentWeek = 4;
//   int totalWeeks = 40;

//   @override
//   void initState() {
//     super.initState();
//     DateTime firstDayOfPregnancy =
//         today.subtract(Duration(days: (currentWeek) * 7));
//     rangeStart = firstDayOfPregnancy;
//     rangeEnd = firstDayOfPregnancy.add(Duration(days: totalWeeks * 7));
//   }

//   void onDaySelected(DateTime day, DateTime focusDay) {
//     setState(() {
//       today = day;
//       currentWeek = ((today.difference(rangeStart!).inDays) / 7).ceil();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TableCalendar(
//             headerStyle: const HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             calendarStyle: const CalendarStyle(
//               todayDecoration: BoxDecoration(
//                 color: ColorManager.colorBody,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: ColorManager.mainColor,
//                 shape: BoxShape.circle,
//               ),
//               outsideDaysVisible: false,
//             ),
//             focusedDay: today,
//             firstDay: DateTime.utc(2010, 10, 10),
//             lastDay: DateTime.utc(2035, 10, 10),
//             availableGestures: AvailableGestures.all,
//             onDaySelected: onDaySelected,
//             selectedDayPredicate: (day) => isSameDay(day, today),
//             rangeStartDay: rangeStart,
//             rangeEndDay: rangeEnd,
//             calendarBuilders: CalendarBuilders(
//               rangeHighlightBuilder: (context, day, isWithinRange) {
//                 if (isWithinRange) {
//                   int weekNumber =
//                       ((day.difference(rangeStart!).inDays) / 7).ceil();
//                   return Container(
//                     margin: const EdgeInsets.symmetric(vertical: 4),
//                     decoration: BoxDecoration(
//                       color: weekNumber == currentWeek
//                           ? ColorManager
//                               .calenderRangeColor // Color for current week
//                           : null,
//                     ),
//                   );
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: const CustomSpeedDial(),
//     );
//   }
// }
import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/view/widgets/custom_speed_dial.dart';
import 'package:app/features/calender/view/widgets/notification_events_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({Key? key, required this.currentWeek}) : super(key: key);
  final int currentWeek;

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;
  // Calculate the range of weeks
  int totalWeeks = 40;
  late int currentWeek; // Declare currentWeek as a property of the state

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventsCubit>(context).fetchAllEvents();
    super.initState();
    DateTime firstDayOfPregnancy =
        today.subtract(Duration(days: widget.currentWeek * 7));
    rangeStart = firstDayOfPregnancy;
    rangeEnd = firstDayOfPregnancy.add(Duration(days: totalWeeks * 7));
    currentWeek = ((today.difference(rangeStart!).inDays) / 7).ceil();
  }

  void onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
      // currentWeek = ((today.difference(rangeStart!).inDays) / 7).ceil();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  int weekNumber =
                      ((day.difference(rangeStart!).inDays) / 7).ceil();
                  // print(weekNumber);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: weekNumber == currentWeek
                          ? ColorManager
                              .calenderRangeColor // Color for current week
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
