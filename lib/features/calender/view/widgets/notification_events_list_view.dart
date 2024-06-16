// import 'package:app/core/resource/string_manage.dart';
// import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
// import 'package:app/features/calender/cubits/events_cubit/eventss_state.dart';
// import 'package:app/features/calender/models/event_model.dart';
// import 'package:app/features/calender/view/widgets/custom_event_item.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// class NotificationEventListView extends StatefulWidget {
//   const NotificationEventListView({super.key});

//   @override
//   State<NotificationEventListView> createState() =>
//       _NotificationEventListViewState();
// }

// class _NotificationEventListViewState extends State<NotificationEventListView> {
//   @override
//   void initState() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EventsCubit, EventsState>(builder: (context, state) {
//       List<EventModel> events = BlocProvider.of<EventsCubit>(context).events!;

//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           padding: EdgeInsets.zero,
//           itemCount: events.length,
//           itemBuilder: (context, index) {
//             EventModel event = events[index];
//             if (event.isNotification) {
//               print("Before scheduling notification");
//               String dateOfNotificationString = event.dateOfNotification;

//               DateTime dateOfNotification = DateFormat("yyyy-MM-dd HH:mm:ss")
//                   .parse(dateOfNotificationString)
//                   .add(const Duration(minutes: 1));

//               AwesomeNotifications().createNotification(
//                 content: NotificationContent(
//                   id: index,
//                   channelKey: StringManager.kBasicKey,
//                   title: event.title,
//                   body: event.content,
//                   // bigPicture: "asset://assets/images/notification.png",
//                   // notificationLayout: NotificationLayout.BigPicture,
//                 ),
//                 schedule: NotificationCalendar.fromDate(
//                   date: dateOfNotification,
//                   allowWhileIdle: true,
//                   preciseAlarm: true,
//                 ),
//               );

//               print("After scheduling notification");
//               print("Parsed DateTime: $dateOfNotification");
//               print("Formatted Date String: $dateOfNotificationString");

//               return CustomEventItem(
//                 eventModel: event,
//               );
//             } else {
//               return Container();
//             }
//           },
//         ),
//       );
//     });
//   }
// }
import 'package:app/features/profile/data/models/is_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/cubits/events_cubit/eventss_state.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/widgets/custom_event_item.dart';

class NotificationEventListView extends StatefulWidget {
  const NotificationEventListView({super.key});

  @override
  State<NotificationEventListView> createState() =>
      _NotificationEventListViewState();
}

class _NotificationEventListViewState extends State<NotificationEventListView> {
  @override
  void initState() {
    checkAndRequestNotificationPermission();
    super.initState();
  }

  Future<void> checkAndRequestNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Notification Permission Required"),
            content: const Text(
                "Please allow notification permission to receive reminders."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  AwesomeNotifications().requestPermissionToSendNotifications();
                },
                child: const Text("Allow"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<EventsCubit, EventsState>(builder: (context, state) {
        List<EventModel> events = BlocProvider.of<EventsCubit>(context).events!;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: events.length,
          itemBuilder: (context, index) {
            EventModel event = events[index];
            if (event.isNotification && IsNotificationModel.isNotification) {
              print("Before scheduling notification");
              String dateOfNotificationString = event.dateOfNotification;

              DateTime dateOfNotification = DateFormat("yyyy-MM-dd HH:mm:ss")
                  .parse(dateOfNotificationString)
                  .add(const Duration(minutes: 1));

              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: index,
                  channelKey: StringManager.kBasicKey,
                  title: event.title,
                  body: event.content,
                ),
                schedule: NotificationCalendar.fromDate(
                  date: dateOfNotification,
                  allowWhileIdle: true,
                  preciseAlarm: true,
                ),
              );

              print("After scheduling notification");
              print("Parsed DateTime: $dateOfNotification");
              print("Formatted Date String: $dateOfNotificationString");

              return CustomEventItem(
                eventModel: event,
              );
            } else {
              return Container();
            }
          },
        ),
      );
    });
  }
}
