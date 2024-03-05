// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 5;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      title: fields[0] as String,
      date: fields[2] as String,
      type: fields[4] as String,
      content: fields[1] as String,
      isNotification: fields[3] as bool,
      selectedMood: (fields[5] as List).cast<String>(),
      dosage: fields[6] as String,
      numberOfTimesADay: fields[7] as String,
      diet: fields[8] as String,
      typeOfMedication: fields[9] as String,
      dateOfNotification: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.isNotification)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.selectedMood)
      ..writeByte(6)
      ..write(obj.dosage)
      ..writeByte(7)
      ..write(obj.numberOfTimesADay)
      ..writeByte(8)
      ..write(obj.diet)
      ..writeByte(9)
      ..write(obj.typeOfMedication)
      ..writeByte(10)
      ..write(obj.dateOfNotification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
