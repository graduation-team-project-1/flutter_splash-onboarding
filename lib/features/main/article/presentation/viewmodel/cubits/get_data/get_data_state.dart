part of 'get_data_cubit.dart';

abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataSucess extends GetDataState {}

class GetDataFailure extends GetDataState {
  final String message;
  GetDataFailure({required this.message});
}
