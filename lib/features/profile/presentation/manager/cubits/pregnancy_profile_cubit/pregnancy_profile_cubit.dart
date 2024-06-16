import 'package:app/features/profile/data/models/pregnancy_profile_model.dart';
import 'package:app/features/profile/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pregnancy_profile_state.dart';

class PregnancyProfileCubit extends Cubit<PregnancyProfileState> {
  PregnancyProfileCubit(this.profileRepo) : super(PregnancyProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> fetchPregnantProfileData({required String bearerToken}) async {
    emit(PregnancyProfileLoading());
    var pregnancyProfileModel =
        await profileRepo.getPregnantInfo(bearerToken: bearerToken);

    pregnancyProfileModel.fold(
        (failure) =>
            emit(PregnancyProfileFailure(errorMessage: failure.errMessage)),
        (pregnancyProfileData) =>
            emit(PregnancyProfileSuccess(pregnancyProfileData)));
  }
}
