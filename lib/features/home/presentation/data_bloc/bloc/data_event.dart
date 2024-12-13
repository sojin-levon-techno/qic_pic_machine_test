part of 'data_bloc.dart';

sealed class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

final class FetchDataEvent extends DataEvent {}

