import 'package:app/features/calender/cubits/events_cubit/eventss_state.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:app/core/resource/string_manage.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  List<EventModel>? events;
  fetchAllEvents() async {
    var eventsBox = Hive.box<EventModel>(StringManager.kEventsBox);
    events = eventsBox.values.toList();
    emit(EventsSuccess());
  }
}
