import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit() : super(AddEventInitial());

  addevent(EventModel eventModel) async {
    emit(AddEventLoading());
    try {
      var eventsBox = Hive.box<EventModel>(StringManager.kEventsBox);
      await eventsBox.add(eventModel);
      emit(AddEventSuccess());
    } catch (e) {
      emit(
        AddEventFailure(e.toString()),
      );
    }
  }
}
