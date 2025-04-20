part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus status,
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default('/') String currentPath,
    @Default(false)  bool isAndroidUser,
    LoginResponseModel? loginResponse,
  }) = _AppState;
}

enum AppStatus { initial, loading, success }
