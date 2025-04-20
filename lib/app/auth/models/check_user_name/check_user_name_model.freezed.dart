// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_user_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckUserNameModel _$CheckUserNameModelFromJson(Map<String, dynamic> json) {
  return _CheckUserNameModel.fromJson(json);
}

/// @nodoc
mixin _$CheckUserNameModel {
  @JsonKey(name: "reqId")
  String? get reqId => throw _privateConstructorUsedError;

  /// Serializes this CheckUserNameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckUserNameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckUserNameModelCopyWith<CheckUserNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserNameModelCopyWith<$Res> {
  factory $CheckUserNameModelCopyWith(
          CheckUserNameModel value, $Res Function(CheckUserNameModel) then) =
      _$CheckUserNameModelCopyWithImpl<$Res, CheckUserNameModel>;
  @useResult
  $Res call({@JsonKey(name: "reqId") String? reqId});
}

/// @nodoc
class _$CheckUserNameModelCopyWithImpl<$Res, $Val extends CheckUserNameModel>
    implements $CheckUserNameModelCopyWith<$Res> {
  _$CheckUserNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckUserNameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqId = freezed,
  }) {
    return _then(_value.copyWith(
      reqId: freezed == reqId
          ? _value.reqId
          : reqId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckUserNameModelImplCopyWith<$Res>
    implements $CheckUserNameModelCopyWith<$Res> {
  factory _$$CheckUserNameModelImplCopyWith(_$CheckUserNameModelImpl value,
          $Res Function(_$CheckUserNameModelImpl) then) =
      __$$CheckUserNameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "reqId") String? reqId});
}

/// @nodoc
class __$$CheckUserNameModelImplCopyWithImpl<$Res>
    extends _$CheckUserNameModelCopyWithImpl<$Res, _$CheckUserNameModelImpl>
    implements _$$CheckUserNameModelImplCopyWith<$Res> {
  __$$CheckUserNameModelImplCopyWithImpl(_$CheckUserNameModelImpl _value,
      $Res Function(_$CheckUserNameModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckUserNameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqId = freezed,
  }) {
    return _then(_$CheckUserNameModelImpl(
      reqId: freezed == reqId
          ? _value.reqId
          : reqId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckUserNameModelImpl implements _CheckUserNameModel {
  const _$CheckUserNameModelImpl({@JsonKey(name: "reqId") this.reqId});

  factory _$CheckUserNameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckUserNameModelImplFromJson(json);

  @override
  @JsonKey(name: "reqId")
  final String? reqId;

  @override
  String toString() {
    return 'CheckUserNameModel(reqId: $reqId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserNameModelImpl &&
            (identical(other.reqId, reqId) || other.reqId == reqId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reqId);

  /// Create a copy of CheckUserNameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserNameModelImplCopyWith<_$CheckUserNameModelImpl> get copyWith =>
      __$$CheckUserNameModelImplCopyWithImpl<_$CheckUserNameModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckUserNameModelImplToJson(
      this,
    );
  }
}

abstract class _CheckUserNameModel implements CheckUserNameModel {
  const factory _CheckUserNameModel(
      {@JsonKey(name: "reqId") final String? reqId}) = _$CheckUserNameModelImpl;

  factory _CheckUserNameModel.fromJson(Map<String, dynamic> json) =
      _$CheckUserNameModelImpl.fromJson;

  @override
  @JsonKey(name: "reqId")
  String? get reqId;

  /// Create a copy of CheckUserNameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserNameModelImplCopyWith<_$CheckUserNameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
