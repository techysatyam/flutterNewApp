// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GenerateCaptchaImplCopyWith<$Res> {
  factory _$$GenerateCaptchaImplCopyWith(_$GenerateCaptchaImpl value,
          $Res Function(_$GenerateCaptchaImpl) then) =
      __$$GenerateCaptchaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerateCaptchaImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GenerateCaptchaImpl>
    implements _$$GenerateCaptchaImplCopyWith<$Res> {
  __$$GenerateCaptchaImplCopyWithImpl(
      _$GenerateCaptchaImpl _value, $Res Function(_$GenerateCaptchaImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GenerateCaptchaImpl implements _GenerateCaptcha {
  const _$GenerateCaptchaImpl();

  @override
  String toString() {
    return 'AuthEvent.generateCaptcha()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenerateCaptchaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return generateCaptcha();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return generateCaptcha?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (generateCaptcha != null) {
      return generateCaptcha();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return generateCaptcha(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return generateCaptcha?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (generateCaptcha != null) {
      return generateCaptcha(this);
    }
    return orElse();
  }
}

abstract class _GenerateCaptcha implements AuthEvent {
  const factory _GenerateCaptcha() = _$GenerateCaptchaImpl;
}

/// @nodoc
abstract class _$$TogglePasswordVisibilityImplCopyWith<$Res> {
  factory _$$TogglePasswordVisibilityImplCopyWith(
          _$TogglePasswordVisibilityImpl value,
          $Res Function(_$TogglePasswordVisibilityImpl) then) =
      __$$TogglePasswordVisibilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConfirmPassword});
}

/// @nodoc
class __$$TogglePasswordVisibilityImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$TogglePasswordVisibilityImpl>
    implements _$$TogglePasswordVisibilityImplCopyWith<$Res> {
  __$$TogglePasswordVisibilityImplCopyWithImpl(
      _$TogglePasswordVisibilityImpl _value,
      $Res Function(_$TogglePasswordVisibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConfirmPassword = null,
  }) {
    return _then(_$TogglePasswordVisibilityImpl(
      isConfirmPassword: null == isConfirmPassword
          ? _value.isConfirmPassword
          : isConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TogglePasswordVisibilityImpl implements _TogglePasswordVisibility {
  const _$TogglePasswordVisibilityImpl({this.isConfirmPassword = false});

  @override
  @JsonKey()
  final bool isConfirmPassword;

  @override
  String toString() {
    return 'AuthEvent.togglePasswordVisibility(isConfirmPassword: $isConfirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogglePasswordVisibilityImpl &&
            (identical(other.isConfirmPassword, isConfirmPassword) ||
                other.isConfirmPassword == isConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConfirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TogglePasswordVisibilityImplCopyWith<_$TogglePasswordVisibilityImpl>
      get copyWith => __$$TogglePasswordVisibilityImplCopyWithImpl<
          _$TogglePasswordVisibilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return togglePasswordVisibility(isConfirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return togglePasswordVisibility?.call(isConfirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(isConfirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class _TogglePasswordVisibility implements AuthEvent {
  const factory _TogglePasswordVisibility({final bool isConfirmPassword}) =
      _$TogglePasswordVisibilityImpl;

  bool get isConfirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TogglePasswordVisibilityImplCopyWith<_$TogglePasswordVisibilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RememberMeImplCopyWith<$Res> {
  factory _$$RememberMeImplCopyWith(
          _$RememberMeImpl value, $Res Function(_$RememberMeImpl) then) =
      __$$RememberMeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class __$$RememberMeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RememberMeImpl>
    implements _$$RememberMeImplCopyWith<$Res> {
  __$$RememberMeImplCopyWithImpl(
      _$RememberMeImpl _value, $Res Function(_$RememberMeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemember = null,
  }) {
    return _then(_$RememberMeImpl(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RememberMeImpl implements _RememberMe {
  const _$RememberMeImpl({this.isRemember = false});

  @override
  @JsonKey()
  final bool isRemember;

  @override
  String toString() {
    return 'AuthEvent.rememberMe(isRemember: $isRemember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RememberMeImpl &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRemember);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      __$$RememberMeImplCopyWithImpl<_$RememberMeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return rememberMe(isRemember);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return rememberMe?.call(isRemember);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (rememberMe != null) {
      return rememberMe(isRemember);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return rememberMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return rememberMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (rememberMe != null) {
      return rememberMe(this);
    }
    return orElse();
  }
}

abstract class _RememberMe implements AuthEvent {
  const factory _RememberMe({final bool isRemember}) = _$RememberMeImpl;

  bool get isRemember;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl();

  @override
  String toString() {
    return 'AuthEvent.login()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login() = _$LoginImpl;
}

/// @nodoc
abstract class _$$CheckUserNameImplCopyWith<$Res> {
  factory _$$CheckUserNameImplCopyWith(
          _$CheckUserNameImpl value, $Res Function(_$CheckUserNameImpl) then) =
      __$$CheckUserNameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckUserNameImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckUserNameImpl>
    implements _$$CheckUserNameImplCopyWith<$Res> {
  __$$CheckUserNameImplCopyWithImpl(
      _$CheckUserNameImpl _value, $Res Function(_$CheckUserNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckUserNameImpl implements _CheckUserName {
  const _$CheckUserNameImpl();

  @override
  String toString() {
    return 'AuthEvent.checkUserName()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckUserNameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return checkUserName();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return checkUserName?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (checkUserName != null) {
      return checkUserName();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return checkUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return checkUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (checkUserName != null) {
      return checkUserName(this);
    }
    return orElse();
  }
}

abstract class _CheckUserName implements AuthEvent {
  const factory _CheckUserName() = _$CheckUserNameImpl;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyOtpImpl implements _VerifyOtp {
  const _$VerifyOtpImpl();

  @override
  String toString() {
    return 'AuthEvent.verifyOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return verifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return verifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements AuthEvent {
  const factory _VerifyOtp() = _$VerifyOtpImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController otpController});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpController = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      otpController: null == otpController
          ? _value.otpController
          : otpController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl implements _ForgotPassword {
  const _$ForgotPasswordImpl({required this.otpController});

  @override
  final TextEditingController otpController;

  @override
  String toString() {
    return 'AuthEvent.forgotPassword(otpController: $otpController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.otpController, otpController) ||
                other.otpController == otpController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otpController);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateCaptcha,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() checkUserName,
    required TResult Function() verifyOtp,
    required TResult Function(TextEditingController otpController)
        forgotPassword,
  }) {
    return forgotPassword(otpController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generateCaptcha,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? checkUserName,
    TResult? Function()? verifyOtp,
    TResult? Function(TextEditingController otpController)? forgotPassword,
  }) {
    return forgotPassword?.call(otpController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateCaptcha,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? checkUserName,
    TResult Function()? verifyOtp,
    TResult Function(TextEditingController otpController)? forgotPassword,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(otpController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateCaptcha value) generateCaptcha,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_CheckUserName value) checkUserName,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ForgotPassword value) forgotPassword,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateCaptcha value)? generateCaptcha,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_CheckUserName value)? checkUserName,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ForgotPassword value)? forgotPassword,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateCaptcha value)? generateCaptcha,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_CheckUserName value)? checkUserName,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ForgotPassword value)? forgotPassword,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPassword implements AuthEvent {
  const factory _ForgotPassword(
          {required final TextEditingController otpController}) =
      _$ForgotPasswordImpl;

  TextEditingController get otpController;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  AuthStatus get status => throw _privateConstructorUsedError;
  AuthRepo get authRepo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get captcha => throw _privateConstructorUsedError;
  dynamic get rememberMe => throw _privateConstructorUsedError;
  LoginResponseModel? get loginResponseModel =>
      throw _privateConstructorUsedError;
  CheckUserNameModel? get checkUserModel => throw _privateConstructorUsedError;
  VerifyOtpModel? get verifyOtpModel => throw _privateConstructorUsedError;
  int get uniqueKey => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  bool get confirmVisibility => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthStatus status,
      AuthRepo authRepo,
      String message,
      String? captcha,
      dynamic rememberMe,
      LoginResponseModel? loginResponseModel,
      CheckUserNameModel? checkUserModel,
      VerifyOtpModel? verifyOtpModel,
      int uniqueKey,
      bool visibility,
      bool confirmVisibility});

  $LoginResponseModelCopyWith<$Res>? get loginResponseModel;
  $CheckUserNameModelCopyWith<$Res>? get checkUserModel;
  $VerifyOtpModelCopyWith<$Res>? get verifyOtpModel;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authRepo = null,
    Object? message = null,
    Object? captcha = freezed,
    Object? rememberMe = freezed,
    Object? loginResponseModel = freezed,
    Object? checkUserModel = freezed,
    Object? verifyOtpModel = freezed,
    Object? uniqueKey = null,
    Object? visibility = null,
    Object? confirmVisibility = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authRepo: null == authRepo
          ? _value.authRepo
          : authRepo // ignore: cast_nullable_to_non_nullable
              as AuthRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      captcha: freezed == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberMe: freezed == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      checkUserModel: freezed == checkUserModel
          ? _value.checkUserModel
          : checkUserModel // ignore: cast_nullable_to_non_nullable
              as CheckUserNameModel?,
      verifyOtpModel: freezed == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel?,
      uniqueKey: null == uniqueKey
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmVisibility: null == confirmVisibility
          ? _value.confirmVisibility
          : confirmVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponseModel {
    if (_value.loginResponseModel == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponseModel!,
        (value) {
      return _then(_value.copyWith(loginResponseModel: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckUserNameModelCopyWith<$Res>? get checkUserModel {
    if (_value.checkUserModel == null) {
      return null;
    }

    return $CheckUserNameModelCopyWith<$Res>(_value.checkUserModel!, (value) {
      return _then(_value.copyWith(checkUserModel: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifyOtpModelCopyWith<$Res>? get verifyOtpModel {
    if (_value.verifyOtpModel == null) {
      return null;
    }

    return $VerifyOtpModelCopyWith<$Res>(_value.verifyOtpModel!, (value) {
      return _then(_value.copyWith(verifyOtpModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus status,
      AuthRepo authRepo,
      String message,
      String? captcha,
      dynamic rememberMe,
      LoginResponseModel? loginResponseModel,
      CheckUserNameModel? checkUserModel,
      VerifyOtpModel? verifyOtpModel,
      int uniqueKey,
      bool visibility,
      bool confirmVisibility});

  @override
  $LoginResponseModelCopyWith<$Res>? get loginResponseModel;
  @override
  $CheckUserNameModelCopyWith<$Res>? get checkUserModel;
  @override
  $VerifyOtpModelCopyWith<$Res>? get verifyOtpModel;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authRepo = null,
    Object? message = null,
    Object? captcha = freezed,
    Object? rememberMe = freezed,
    Object? loginResponseModel = freezed,
    Object? checkUserModel = freezed,
    Object? verifyOtpModel = freezed,
    Object? uniqueKey = null,
    Object? visibility = null,
    Object? confirmVisibility = null,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authRepo: null == authRepo
          ? _value.authRepo
          : authRepo // ignore: cast_nullable_to_non_nullable
              as AuthRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      captcha: freezed == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberMe: freezed == rememberMe ? _value.rememberMe! : rememberMe,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      checkUserModel: freezed == checkUserModel
          ? _value.checkUserModel
          : checkUserModel // ignore: cast_nullable_to_non_nullable
              as CheckUserNameModel?,
      verifyOtpModel: freezed == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel?,
      uniqueKey: null == uniqueKey
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmVisibility: null == confirmVisibility
          ? _value.confirmVisibility
          : confirmVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.status = AuthStatus.initial,
      required this.authRepo,
      this.message = '',
      this.captcha,
      this.rememberMe = false,
      this.loginResponseModel,
      this.checkUserModel,
      this.verifyOtpModel,
      this.uniqueKey = 0,
      this.visibility = true,
      this.confirmVisibility = true});

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  final AuthRepo authRepo;
  @override
  @JsonKey()
  final String message;
  @override
  final String? captcha;
  @override
  @JsonKey()
  final dynamic rememberMe;
  @override
  final LoginResponseModel? loginResponseModel;
  @override
  final CheckUserNameModel? checkUserModel;
  @override
  final VerifyOtpModel? verifyOtpModel;
  @override
  @JsonKey()
  final int uniqueKey;
  @override
  @JsonKey()
  final bool visibility;
  @override
  @JsonKey()
  final bool confirmVisibility;

  @override
  String toString() {
    return 'AuthState(status: $status, authRepo: $authRepo, message: $message, captcha: $captcha, rememberMe: $rememberMe, loginResponseModel: $loginResponseModel, checkUserModel: $checkUserModel, verifyOtpModel: $verifyOtpModel, uniqueKey: $uniqueKey, visibility: $visibility, confirmVisibility: $confirmVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.authRepo, authRepo) ||
                other.authRepo == authRepo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.captcha, captcha) || other.captcha == captcha) &&
            const DeepCollectionEquality()
                .equals(other.rememberMe, rememberMe) &&
            (identical(other.loginResponseModel, loginResponseModel) ||
                other.loginResponseModel == loginResponseModel) &&
            (identical(other.checkUserModel, checkUserModel) ||
                other.checkUserModel == checkUserModel) &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel) &&
            (identical(other.uniqueKey, uniqueKey) ||
                other.uniqueKey == uniqueKey) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.confirmVisibility, confirmVisibility) ||
                other.confirmVisibility == confirmVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      authRepo,
      message,
      captcha,
      const DeepCollectionEquality().hash(rememberMe),
      loginResponseModel,
      checkUserModel,
      verifyOtpModel,
      uniqueKey,
      visibility,
      confirmVisibility);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final AuthStatus status,
      required final AuthRepo authRepo,
      final String message,
      final String? captcha,
      final dynamic rememberMe,
      final LoginResponseModel? loginResponseModel,
      final CheckUserNameModel? checkUserModel,
      final VerifyOtpModel? verifyOtpModel,
      final int uniqueKey,
      final bool visibility,
      final bool confirmVisibility}) = _$AuthStateImpl;

  @override
  AuthStatus get status;
  @override
  AuthRepo get authRepo;
  @override
  String get message;
  @override
  String? get captcha;
  @override
  dynamic get rememberMe;
  @override
  LoginResponseModel? get loginResponseModel;
  @override
  CheckUserNameModel? get checkUserModel;
  @override
  VerifyOtpModel? get verifyOtpModel;
  @override
  int get uniqueKey;
  @override
  bool get visibility;
  @override
  bool get confirmVisibility;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
