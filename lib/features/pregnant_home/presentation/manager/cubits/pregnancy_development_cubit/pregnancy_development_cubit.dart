import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pregnancy_development_state.dart';

class PregnancyDevelopmentCubit extends Cubit<PregnancyDevelopmentState> {
  PregnancyDevelopmentCubit(this.homeRepo)
      : super(PregnancyDevelopmentInitial());

  final HomeRepo homeRepo;
  Future<void> fetchPregnancyDevelopmentInfo({required int week, required String bearerToken}) async {
    emit(PregnancyDevelopmentLoading());
    var pregnancyModel = await homeRepo.getPregnancyDevelopmentInfo(week: week);
    pregnancyModel.fold(
        (failure) =>
            emit(PregnancyDevelopmentFailure(errorMessage: failure.errMessage)),
        (pregnancyDevelopmentInfo) =>
            emit(PregnancyDevelopmentSuccess(pregnancyDevelopmentInfo)));
  }
}
