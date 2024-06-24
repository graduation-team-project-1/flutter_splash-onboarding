part of 'pregnancy_profile_cubit.dart';

sealed class PregnancyProfileState extends Equatable {
  const PregnancyProfileState();

  @override
  List<Object> get props => [];
}

final class PregnancyProfileInitial extends PregnancyProfileState {}

final class PregnancyProfileLoading extends PregnancyProfileState {}

final class PregnancyProfileFailure extends PregnancyProfileState {
  final String errorMessage;
  const PregnancyProfileFailure({required this.errorMessage});
}

final class PregnancyProfileSuccess extends PregnancyProfileState {
  final PregnancyProfileModel pregnancyProfileModel;

  const PregnancyProfileSuccess(this.pregnancyProfileModel);
}
