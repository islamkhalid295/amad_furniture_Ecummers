part of 'basic_data_cubit.dart';

@immutable
abstract class BasicDataState {}

class BasicDataInitial extends BasicDataState {}

class GetBasicDataLoading extends BasicDataState {}
class GetBasicDataSuccess extends BasicDataState {}
class GetBasicDataError extends BasicDataState {
  final String error;

  GetBasicDataError(this.error);
}