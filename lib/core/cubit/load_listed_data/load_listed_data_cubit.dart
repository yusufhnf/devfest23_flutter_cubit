import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'load_listed_data_state.dart';
part 'load_listed_data_cubit.freezed.dart';

abstract class LoadListedDataCubit<T> extends Cubit<LoadListedDataState<T>> {
  LoadListedDataCubit() : super(const LoadListedDataState.initial()) {
    _initial();
  }

  void _initial() async {
    await getData();
  }

  Future getData() async {
    emit(const LoadListedDataState.loading());
    final Either<AppException, List<T>> result = await fetchData();
    result.fold((error) => emit(LoadListedDataState.error(error: error)),
        (itemList) {
      if (itemList.isEmpty) {
        emit(const LoadListedDataState.empty());
      } else {
        emit(LoadListedDataState.success(data: itemList));
      }
    });
  }

  Future<Either<AppException, List<T>>> fetchData();
}
