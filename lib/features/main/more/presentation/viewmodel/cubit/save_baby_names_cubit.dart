import 'package:app/core/resource/share_pref.dart';
import 'package:bloc/bloc.dart';

part 'save_baby_names_state.dart';

class SaveBabyNamesCubit extends Cubit<SaveBabyNamesState> {
  SaveBabyNamesCubit(this._appSharedPref) : super(SaveBabyNamesInitial());

  final AppSharedPref _appSharedPref;
  List<String> boyBabyNames = [];

  void saveBoyName(String boyName) {
    boyBabyNames.add(boyName);
    emit(SaveBabyNames());
  }

  void removeBoyName(String boyName) {
    if (boyBabyNames.contains(boyName)) {
      boyBabyNames.remove(boyName);
      emit(RemoveBabyNames());
    }
  }
}
