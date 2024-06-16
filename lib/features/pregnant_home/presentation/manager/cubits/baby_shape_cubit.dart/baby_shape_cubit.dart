import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'baby_shape_state.dart';

class BabyShapeCubit extends Cubit<BabyShapeState> {
  BabyShapeCubit(this.homeRepo) : super(BabyShapeInitial());

  final HomeRepo homeRepo;
  Future<void> fetchBabyShape({required int week}) async {
    emit(BabyShapeLoading());
    var pregnancyModel = await homeRepo.getPregnancyDevelopmentInfo(week: week);

    pregnancyModel.fold(
        (failure) => emit(BabyShapeFailure(errorMessage: failure.errMessage)),
        (babyShapeInfo) => emit(BabyShapeSuccess(babyShapeInfo)));
  }
}
