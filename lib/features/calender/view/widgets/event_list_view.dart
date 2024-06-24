import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/cubits/events_cubit/eventss_state.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/custom_event_item.dart';
import 'package:intl/intl.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(builder: (context, state) {
      List<EventModel> events = BlocProvider.of<EventsCubit>(context).events!;

      if (events.isEmpty) {
        return Center(
          child: Text(
            'you have no events',
            style: Styles.textStyle16.copyWith(
                fontFamily: FontType.kRoboto, color: ColorManager.barColor),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GroupListView(
            sectionsCount: 3,
            countOfItemInSection: (int section) {
              switch (section) {
                case 0:
                  return events
                      .where((event) => isToday(event.date))
                      .toList()
                      .length;
                case 1:
                  return events
                      .where((event) => isYesterday(event.date))
                      .toList()
                      .length;
                case 2:
                  return events
                      .where((event) => isEarlier(event.date))
                      .toList()
                      .length;
                default:
                  return 0;
              }
            },
            itemBuilder: (context, index) {
              List<EventModel> todayEvents =
                  events.where((event) => isToday(event.date)).toList();
              List<EventModel> yesterdayEvents =
                  events.where((event) => isYesterday(event.date)).toList();

              switch (index.section) {
                case 0:
                  return CustomEventItem(
                    eventModel: todayEvents[index.index],
                  );
                case 1:
                  return CustomEventItem(
                    eventModel: yesterdayEvents[index.index],
                  );
                case 2:
                  int offset = todayEvents.length + yesterdayEvents.length;
                  return CustomEventItem(
                    eventModel: events[index.index + offset],
                  );
                default:
                  return Container();
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            sectionSeparatorBuilder: (context, section) =>
                const SizedBox(height: 10),
            groupHeaderBuilder: (BuildContext context, int section) {
              int itemCount = 0;
              String title = '';
              switch (section) {
                case 0:
                  title = 'Today';
                  itemCount = events
                      .where((event) => isToday(event.date))
                      .toList()
                      .length;
                  break;
                case 1:
                  title = 'Yesterday';
                  itemCount = events
                      .where((event) => isYesterday(event.date))
                      .toList()
                      .length;
                  break;
                case 2:
                  title = 'Earlier';
                  itemCount = events
                      .where((event) => isEarlier(event.date))
                      .toList()
                      .length;
                  break;
              }
              return itemCount > 0
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        title,
                        style: Styles.textStyle16.copyWith(
                          color: ColorManager.barColor,
                          fontFamily: FontType.kRoboto,
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        );
      }
    });
  }

  bool isToday(String date) {
    DateTime eventDate = DateFormat('HH:mm dd MMMM y').parse(date);
    DateTime today = DateTime.now();
    return eventDate.year == today.year &&
        eventDate.month == today.month &&
        eventDate.day == today.day;
  }

  bool isYesterday(String date) {
    DateTime eventDate = DateFormat('HH:mm dd MMMM y').parse(date);
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    return eventDate.year == yesterday.year &&
        eventDate.month == yesterday.month &&
        eventDate.day == yesterday.day;
  }

  bool isEarlier(String date) {
    DateTime eventDate = DateFormat('HH:mm dd MMMM y').parse(date);
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    return eventDate.isBefore(today) && eventDate.isBefore(yesterday);
  }
}
