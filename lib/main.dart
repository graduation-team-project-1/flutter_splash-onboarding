import 'package:app/core/app.dart';
import 'package:app/core/resource/dependency_injection.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/service_locator.dart';
import 'package:app/core/resource/simple_bloc_observer.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/profile/data/models/is_notification_model.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await appDI();
  await Hive.initFlutter();

  await IsNotificationModel.loadIsNotification();

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(EventModelAdapter());
  await Hive.openBox<EventModel>(StringManager.kEventsBox); // var eventsBox =
  // await eventsBox.clear();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "basic_channel",
      channelName: "Basic Notifications",
      defaultColor: ColorManager.mainColor,
      channelDescription: "Notification for App",
      importance: NotificationImportance.High,
      channelShowBadge: true,
      playSound: true,
    )
  ]);

  runApp(MyApp.internal());
}
