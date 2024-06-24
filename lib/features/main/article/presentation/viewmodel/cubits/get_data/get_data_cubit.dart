import 'package:bloc/bloc.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  // her we need to create repo and on this repo will get data on fold way 

  void getData() {
    emit(GetDataLoading());
    // her will get data on fold way 
  }
}
