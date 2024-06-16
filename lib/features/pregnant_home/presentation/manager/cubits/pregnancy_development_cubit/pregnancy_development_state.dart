part of 'pregnancy_development_cubit.dart';

sealed class PregnancyDevelopmentState extends Equatable {
  const PregnancyDevelopmentState();

  @override
  List<Object> get props => [];
}

final class PregnancyDevelopmentInitial extends PregnancyDevelopmentState {}

final class PregnancyDevelopmentLoading extends PregnancyDevelopmentState {}

final class PregnancyDevelopmentFailure extends PregnancyDevelopmentState {
  final String errorMessage;

  const PregnancyDevelopmentFailure({required this.errorMessage});
}

final class PregnancyDevelopmentSuccess extends PregnancyDevelopmentState {
  final PregnancyModel pregnancyModel;

  const PregnancyDevelopmentSuccess(this.pregnancyModel);
}
