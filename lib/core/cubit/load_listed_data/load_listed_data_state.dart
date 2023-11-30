part of 'load_listed_data_cubit.dart';

@freezed
class LoadListedDataState<T> with _$LoadListedDataState<T> {
  const factory LoadListedDataState.initial() = _Initial<T>;
  const factory LoadListedDataState.loading() = _Loading<T>;
  const factory LoadListedDataState.empty() = _Empty<T>;
  const factory LoadListedDataState.error({required AppException error}) =
      _Error<T>;
  const factory LoadListedDataState.success({required List<T> data}) =
      _Success<T>;
}
