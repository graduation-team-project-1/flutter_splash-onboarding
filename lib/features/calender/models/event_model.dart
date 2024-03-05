import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 5)
class EventModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  final String date;

  @HiveField(3)
  bool isNotification;

  @HiveField(4)
  final String type;

  @HiveField(5)
  List<String> selectedMood;

  @HiveField(6)
  String dosage;

  @HiveField(7)
  String numberOfTimesADay;

  @HiveField(8)
  String diet;

  @HiveField(9)
  String typeOfMedication;

  @HiveField(10)
  String dateOfNotification;

  EventModel({
    required this.title,
    required this.date,
    required this.type,
    this.content = "",
    this.isNotification = false,
    this.selectedMood = const [],
    this.dosage = "",
    this.numberOfTimesADay = "",
    this.diet = "",
    this.typeOfMedication = "",
    this.dateOfNotification = "",
  });
}
