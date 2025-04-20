// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) switchDarkMode,
    required TResult Function(String path) changePath,
    required TResult Function(LoginResponseModel? loginResponseModel)
        updateLoginResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? switchDarkMode,
    TResult? Function(String path)? changePath,
    TResult? Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? switchDarkMode,
    TResult Function(String path)? changePath,
    TResult Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_ChangePath value) changePath,
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_ChangePath value)? changePath,
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_ChangePath value)? changePath,
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SwitchDarkModeImplCopyWith<$Res> {
  factory _$$SwitchDarkModeImplCopyWith(_$SwitchDarkModeImpl value,
          $Res Function(_$SwitchDarkModeImpl) then) =
      __$$SwitchDarkModeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$SwitchDarkModeImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$SwitchDarkModeImpl>
    implements _$$SwitchDarkModeImplCopyWith<$Res> {
  __$$SwitchDarkModeImplCopyWithImpl(
      _$SwitchDarkModeImpl _value, $Res Function(_$SwitchDarkModeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$SwitchDarkModeImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SwitchDarkModeImpl implements _SwitchDarkMode {
  const _$SwitchDarkModeImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'AppEvent.switchDarkMode(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDarkModeImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchDarkModeImplCopyWith<_$SwitchDarkModeImpl> get copyWith =>
      __$$SwitchDarkModeImplCopyWithImpl<_$SwitchDarkModeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) switchDarkMode,
    required TResult Function(String path) changePath,
    required TResult Function(LoginResponseModel? loginResponseModel)
        updateLoginResponse,
  }) {
    return switchDarkMode(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? switchDarkMode,
    TResult? Function(String path)? changePath,
    TResult? Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
  }) {
    return switchDarkMode?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? switchDarkMode,
    TResult Function(String path)? changePath,
    TResult Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
    required TResult orElse(),
  }) {
    if (switchDarkMode != null) {
      return switchDarkMode(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_ChangePath value) changePath,
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
  }) {
    return switchDarkMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_ChangePath value)? changePath,
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
  }) {
    return switchDarkMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_ChangePath value)? changePath,
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    required TResult orElse(),
  }) {
    if (switchDarkMode != null) {
      return switchDarkMode(this);
    }
    return orElse();
  }
}

abstract class _SwitchDarkMode implements AppEvent {
  const factory _SwitchDarkMode({final bool isDarkMode}) = _$SwitchDarkModeImpl;

  bool get isDarkMode;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchDarkModeImplCopyWith<_$SwitchDarkModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePathImplCopyWith<$Res> {
  factory _$$ChangePathImplCopyWith(
          _$ChangePathImpl value, $Res Function(_$ChangePathImpl) then) =
      __$$ChangePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$ChangePathImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangePathImpl>
    implements _$$ChangePathImplCopyWith<$Res> {
  __$$ChangePathImplCopyWithImpl(
      _$ChangePathImpl _value, $Res Function(_$ChangePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$ChangePathImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePathImpl implements _ChangePath {
  const _$ChangePathImpl(this.path);

  @override
  final String path;

  @override
  String toString() {
    return 'AppEvent.changePath(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePathImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePathImplCopyWith<_$ChangePathImpl> get copyWith =>
      __$$ChangePathImplCopyWithImpl<_$ChangePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) switchDarkMode,
    required TResult Function(String path) changePath,
    required TResult Function(LoginResponseModel? loginResponseModel)
        updateLoginResponse,
  }) {
    return changePath(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? switchDarkMode,
    TResult? Function(String path)? changePath,
    TResult? Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
  }) {
    return changePath?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? switchDarkMode,
    TResult Function(String path)? changePath,
    TResult Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
    required TResult orElse(),
  }) {
    if (changePath != null) {
      return changePath(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_ChangePath value) changePath,
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
  }) {
    return changePath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_ChangePath value)? changePath,
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
  }) {
    return changePath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_ChangePath value)? changePath,
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    required TResult orElse(),
  }) {
    if (changePath != null) {
      return changePath(this);
    }
    return orElse();
  }
}

abstract class _ChangePath implements AppEvent {
  const factory _ChangePath(final String path) = _$ChangePathImpl;

  String get path;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePathImplCopyWith<_$ChangePathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLoginResponseImplCopyWith<$Res> {
  factory _$$UpdateLoginResponseImplCopyWith(_$UpdateLoginResponseImpl value,
          $Res Function(_$UpdateLoginResponseImpl) then) =
      __$$UpdateLoginResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginResponseModel? loginResponseModel});

  $LoginResponseModelCopyWith<$Res>? get loginResponseModel;
}

/// @nodoc
class __$$UpdateLoginResponseImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateLoginResponseImpl>
    implements _$$UpdateLoginResponseImplCopyWith<$Res> {
  __$$UpdateLoginResponseImplCopyWithImpl(_$UpdateLoginResponseImpl _value,
      $Res Function(_$UpdateLoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginResponseModel = freezed,
  }) {
    return _then(_$UpdateLoginResponseImpl(
      freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ));
  }

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponseModel {
    if (_value.loginResponseModel == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponseModel!,
        (value) {
      return _then(_value.copyWith(loginResponseModel: value));
    });
  }
}

/// @nodoc

class _$UpdateLoginResponseImpl implements _UpdateLoginResponse {
  const _$UpdateLoginResponseImpl(this.loginResponseModel);

  @override
  final LoginResponseModel? loginResponseModel;

  @override
  String toString() {
    return 'AppEvent.updateLoginResponse(loginResponseModel: $loginResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLoginResponseImpl &&
            (identical(other.loginResponseModel, loginResponseModel) ||
                other.loginResponseModel == loginResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginResponseModel);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLoginResponseImplCopyWith<_$UpdateLoginResponseImpl> get copyWith =>
      __$$UpdateLoginResponseImplCopyWithImpl<_$UpdateLoginResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) switchDarkMode,
    required TResult Function(String path) changePath,
    required TResult Function(LoginResponseModel? loginResponseModel)
        updateLoginResponse,
  }) {
    return updateLoginResponse(loginResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? switchDarkMode,
    TResult? Function(String path)? changePath,
    TResult? Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
  }) {
    return updateLoginResponse?.call(loginResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? switchDarkMode,
    TResult Function(String path)? changePath,
    TResult Function(LoginResponseModel? loginResponseModel)?
        updateLoginResponse,
    required TResult orElse(),
  }) {
    if (updateLoginResponse != null) {
      return updateLoginResponse(loginResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_ChangePath value) changePath,
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
  }) {
    return updateLoginResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_ChangePath value)? changePath,
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
  }) {
    return updateLoginResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_ChangePath value)? changePath,
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    required TResult orElse(),
  }) {
    if (updateLoginResponse != null) {
      return updateLoginResponse(this);
    }
    return orElse();
  }
}

abstract class _UpdateLoginResponse implements AppEvent {
  const factory _UpdateLoginResponse(
      final LoginResponseModel? loginResponseModel) = _$UpdateLoginResponseImpl;

  LoginResponseModel? get loginResponseModel;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateLoginResponseImplCopyWith<_$UpdateLoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  AppStatus get status => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  String get currentPath => throw _privateConstructorUsedError;
  bool get isAndroidUser => throw _privateConstructorUsedError;
  LoginResponseModel? get loginResponse => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AppStatus status,
      ThemeMode themeMode,
      String currentPath,
      bool isAndroidUser,
      LoginResponseModel? loginResponse});

  $LoginResponseModelCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themeMode = null,
    Object? currentPath = null,
    Object? isAndroidUser = null,
    Object? loginResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      currentPath: null == currentPath
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as String,
      isAndroidUser: null == isAndroidUser
          ? _value.isAndroidUser
          : isAndroidUser // ignore: cast_nullable_to_non_nullable
              as bool,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponse {
    if (_value.loginResponse == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponse!, (value) {
      return _then(_value.copyWith(loginResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppStatus status,
      ThemeMode themeMode,
      String currentPath,
      bool isAndroidUser,
      LoginResponseModel? loginResponse});

  @override
  $LoginResponseModelCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themeMode = null,
    Object? currentPath = null,
    Object? isAndroidUser = null,
    Object? loginResponse = freezed,
  }) {
    return _then(_$AppStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      currentPath: null == currentPath
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as String,
      isAndroidUser: null == isAndroidUser
          ? _value.isAndroidUser
          : isAndroidUser // ignore: cast_nullable_to_non_nullable
              as bool,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.status = AppStatus.initial,
      this.themeMode = ThemeMode.light,
      this.currentPath = '/',
      this.isAndroidUser = false,
      this.loginResponse});

  @override
  @JsonKey()
  final AppStatus status;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final String currentPath;
  @override
  @JsonKey()
  final bool isAndroidUser;
  @override
  final LoginResponseModel? loginResponse;

  @override
  String toString() {
    return 'AppState(status: $status, themeMode: $themeMode, currentPath: $currentPath, isAndroidUser: $isAndroidUser, loginResponse: $loginResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.currentPath, currentPath) ||
                other.currentPath == currentPath) &&
            (identical(other.isAndroidUser, isAndroidUser) ||
                other.isAndroidUser == isAndroidUser) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, themeMode, currentPath,
      isAndroidUser, loginResponse);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final AppStatus status,
      final ThemeMode themeMode,
      final String currentPath,
      final bool isAndroidUser,
      final LoginResponseModel? loginResponse}) = _$AppStateImpl;

  @override
  AppStatus get status;
  @override
  ThemeMode get themeMode;
  @override
  String get currentPath;
  @override
  bool get isAndroidUser;
  @override
  LoginResponseModel? get loginResponse;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
