part of 'data_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

final class DataInitial extends DataState {}

final class DataLoading extends DataState {}

final class DataSuccess extends DataState {
  final List<DataModel> result;
  const DataSuccess({required this.result});
}

final class DataError extends DataState {
  final String message;

  const DataError({required this.message});
}
