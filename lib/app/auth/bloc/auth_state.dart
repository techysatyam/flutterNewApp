part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    required AuthRepo authRepo,
    @Default('') String message,
    String? captcha,
    @Default(false) rememberMe,
    LoginResponseModel? loginResponseModel,
    CheckUserNameModel? checkUserModel,
    VerifyOtpModel? verifyOtpModel,
    @Default(0) int uniqueKey,
    @Default(true) bool visibility,
    @Default(true) bool confirmVisibility,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  loading,
  updating,
  error,
  toastError,
  success,
  completed,
  logoutSuccessful,
  checkUserNameLoading,
  checkUserNameSuccess,
  verifyOtpLoading,
  verifyOtpSuccess,
  createPassLoading,
  createPassSuccess,
}