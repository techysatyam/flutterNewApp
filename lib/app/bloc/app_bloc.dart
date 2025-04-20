import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/models/login/login_response_model.dart';

part 'app_event.dart';

part 'app_state.dart';

part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    state.isAndroidUser == true;
    on<_SwitchDarkMode>((event, emit) async {
      emit(state.copyWith(
          themeMode: !event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
    });

    on<_ChangePath>((event, emit) {
      emit(state.copyWith(status: AppStatus.initial, currentPath: event.path));
    });

    on<_UpdateLoginResponse>((event, emit) {
      emit(state.copyWith(
          status: AppStatus.initial, loginResponse: event.loginResponseModel));
    });
  }
}
