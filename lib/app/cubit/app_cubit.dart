import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeThemeMode() {
    if (state.themeMode == ThemeMode.dark) {
      emit(state.copyWith(themeMode: ThemeMode.light));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    }
  }
}
