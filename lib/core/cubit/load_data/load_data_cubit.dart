import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'load_data_state.dart';
part 'load_data_cubit.freezed.dart';

abstract class LoadDataCubit<T> extends Cubit<LoadDataState<T>> {
  LoadDataCubit() : super(const LoadDataState.initial()) {
    _initial();
  }

  void _initial() async {
    await getData();
  }

  Future getData() async {
    emit(const LoadDataState.loading());
    final Either<AppException, T> result = await fetchData();
    result.fold((error) => emit(LoadDataState.error(error: error)), (item) {
      emit(LoadDataState.success(result: item));
    });
  }

  Future<Either<AppException, T>> fetchData();
}
