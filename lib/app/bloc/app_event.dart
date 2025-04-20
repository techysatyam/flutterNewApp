part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.switchDarkMode({@Default(false)bool isDarkMode}) =_SwitchDarkMode;
  const factory AppEvent.changePath(String path) = _ChangePath;
  const factory AppEvent.updateLoginResponse(LoginResponseModel? loginResponseModel) = _UpdateLoginResponse;

}
