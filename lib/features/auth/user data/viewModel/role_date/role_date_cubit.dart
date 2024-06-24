import 'package:bloc/bloc.dart';

part 'role_date_state.dart';

class RoleDateCubit extends Cubit<RoleDateState> {
  RoleDateCubit() : super(RoleDateInitial());

  void setRoleValue({required String value}) {
    if (value == "fristDay") {
      emit(FirstDay());
    } else if (value == "estimated") {
      emit(EstimatedtDay());
    } else {
      emit(ConceptionDay());
    }
  }
}


