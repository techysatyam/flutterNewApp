part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.generateCaptcha() = _GenerateCaptcha;

  const factory AuthEvent.togglePasswordVisibility(
      {@Default(false) bool isConfirmPassword}) = _TogglePasswordVisibility;

  const factory AuthEvent.rememberMe({@Default(false) bool isRemember}) =
      _RememberMe;

  const factory AuthEvent.login() = _Login;

  const factory AuthEvent.checkUserName() = _CheckUserName;

  const factory AuthEvent.verifyOtp() = _VerifyOtp;

  const factory AuthEvent.forgotPassword(
      {required TextEditingController otpController}) = _ForgotPassword;
}
