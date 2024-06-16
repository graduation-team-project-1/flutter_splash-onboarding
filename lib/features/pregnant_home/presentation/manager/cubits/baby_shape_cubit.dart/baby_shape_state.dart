part of 'baby_shape_cubit.dart';

sealed class BabyShapeState extends Equatable {
  const BabyShapeState();

  @override
  List<Object> get props => [];
}

final class BabyShapeInitial extends BabyShapeState {}

final class BabyShapeLoading extends BabyShapeState {}

final class BabyShapeFailure extends BabyShapeState {
  final String errorMessage;

  const BabyShapeFailure({required this.errorMessage});
}

final class BabyShapeSuccess extends BabyShapeState {
  final PregnancyModel pregnancyModel;

  const BabyShapeSuccess(this.pregnancyModel);
}
