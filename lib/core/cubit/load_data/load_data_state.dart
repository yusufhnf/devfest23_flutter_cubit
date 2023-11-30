part of 'load_data_cubit.dart';

@freezed
class LoadDataState<T> with _$LoadDataState<T> {
  const factory LoadDataState.initial() = _Initial<T>;
  const factory LoadDataState.loading() = _Loading<T>;
  const factory LoadDataState.error({required AppException error}) = _Error<T>;
  const factory LoadDataState.success({required T result}) = _Success<T>;
}
