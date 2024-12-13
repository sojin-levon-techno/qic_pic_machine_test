import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qic/data/models/data_model.dart';
import 'package:qic/data/repo/data_repo.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<FetchDataEvent>(_fetchDataEvent);
  }

  final dataRepo = DataRepo();

  FutureOr<void> _fetchDataEvent(
    FetchDataEvent event,
    Emitter<DataState> emit,
  ) async {
    try {
      emit(DataLoading());
      final result = await dataRepo.fetchData();
      emit(DataSuccess(result: result));
    } catch (e) {
      emit(DataError(message: e.toString()));
    }
  }
}
