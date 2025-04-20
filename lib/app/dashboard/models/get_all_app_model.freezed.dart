// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllAppModel _$GetAllAppModelFromJson(Map<String, dynamic> json) {
  return _GetAllAppModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllAppModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<GetForm>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "pagination")
  Pagination? get pagination => throw _privateConstructorUsedError;

  /// Serializes this GetAllAppModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllAppModelCopyWith<GetAllAppModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllAppModelCopyWith<$Res> {
  factory $GetAllAppModelCopyWith(
          GetAllAppModel value, $Res Function(GetAllAppModel) then) =
      _$GetAllAppModelCopyWithImpl<$Res, GetAllAppModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "data") List<GetForm>? data,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "pagination") Pagination? pagination});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GetAllAppModelCopyWithImpl<$Res, $Val extends GetAllAppModel>
    implements $GetAllAppModelCopyWith<$Res> {
  _$GetAllAppModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetForm>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ) as $Val);
  }

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetAllAppModelImplCopyWith<$Res>
    implements $GetAllAppModelCopyWith<$Res> {
  factory _$$GetAllAppModelImplCopyWith(_$GetAllAppModelImpl value,
          $Res Function(_$GetAllAppModelImpl) then) =
      __$$GetAllAppModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "data") List<GetForm>? data,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "pagination") Pagination? pagination});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GetAllAppModelImplCopyWithImpl<$Res>
    extends _$GetAllAppModelCopyWithImpl<$Res, _$GetAllAppModelImpl>
    implements _$$GetAllAppModelImplCopyWith<$Res> {
  __$$GetAllAppModelImplCopyWithImpl(
      _$GetAllAppModelImpl _value, $Res Function(_$GetAllAppModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$GetAllAppModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetForm>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllAppModelImpl implements _GetAllAppModel {
  const _$GetAllAppModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "data") final List<GetForm>? data,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "pagination") this.pagination})
      : _data = data;

  factory _$GetAllAppModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllAppModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  final List<GetForm>? _data;
  @override
  @JsonKey(name: "data")
  List<GetForm>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  @override
  String toString() {
    return 'GetAllAppModel(status: $status, data: $data, message: $message, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllAppModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_data), message, pagination);

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllAppModelImplCopyWith<_$GetAllAppModelImpl> get copyWith =>
      __$$GetAllAppModelImplCopyWithImpl<_$GetAllAppModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllAppModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllAppModel implements GetAllAppModel {
  const factory _GetAllAppModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "data") final List<GetForm>? data,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "pagination") final Pagination? pagination}) =
      _$GetAllAppModelImpl;

  factory _GetAllAppModel.fromJson(Map<String, dynamic> json) =
      _$GetAllAppModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "data")
  List<GetForm>? get data;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "pagination")
  Pagination? get pagination;

  /// Create a copy of GetAllAppModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllAppModelImplCopyWith<_$GetAllAppModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetForm _$GetFormFromJson(Map<String, dynamic> json) {
  return _GetForm.fromJson(json);
}

/// @nodoc
mixin _$GetForm {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "app_name")
  String? get appName => throw _privateConstructorUsedError;
  @JsonKey(name: "app_description")
  String? get appDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "app_version")
  String? get appVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "apk_file")
  String? get apkFile => throw _privateConstructorUsedError;
  @JsonKey(name: "app_icon")
  String? get appIcon => throw _privateConstructorUsedError;
  @JsonKey(name: "package_name")
  String? get packageName => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "long_description")
  String? get longDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "ratings")
  int? get ratings => throw _privateConstructorUsedError;
  @JsonKey(name: "rated")
  String? get rated => throw _privateConstructorUsedError;
  @JsonKey(name: "screenshot1")
  String? get screenshot1 => throw _privateConstructorUsedError;
  @JsonKey(name: "screenshot2")
  String? get screenshot2 => throw _privateConstructorUsedError;
  @JsonKey(name: "screenshot3")
  String? get screenshot3 => throw _privateConstructorUsedError;
  @JsonKey(name: "screenshot4")
  String? get screenshot4 => throw _privateConstructorUsedError;
  @JsonKey(name: "screenshot5")
  String? get screenshot5 => throw _privateConstructorUsedError;
  @JsonKey(name: "size_mb")
  int? get sizeMb => throw _privateConstructorUsedError;
  @JsonKey(name: "developer_name")
  String? get developerName => throw _privateConstructorUsedError;
  @JsonKey(name: "privacy_policy_url")
  String? get privacyPolicyUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "website_url")
  String? get websiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "release_notes")
  String? get releaseNotes => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this GetForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetFormCopyWith<GetForm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFormCopyWith<$Res> {
  factory $GetFormCopyWith(GetForm value, $Res Function(GetForm) then) =
      _$GetFormCopyWithImpl<$Res, GetForm>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "app_name") String? appName,
      @JsonKey(name: "app_description") String? appDescription,
      @JsonKey(name: "app_version") String? appVersion,
      @JsonKey(name: "apk_file") String? apkFile,
      @JsonKey(name: "app_icon") String? appIcon,
      @JsonKey(name: "package_name") String? packageName,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "long_description") String? longDescription,
      @JsonKey(name: "ratings") int? ratings,
      @JsonKey(name: "rated") String? rated,
      @JsonKey(name: "screenshot1") String? screenshot1,
      @JsonKey(name: "screenshot2") String? screenshot2,
      @JsonKey(name: "screenshot3") String? screenshot3,
      @JsonKey(name: "screenshot4") String? screenshot4,
      @JsonKey(name: "screenshot5") String? screenshot5,
      @JsonKey(name: "size_mb") int? sizeMb,
      @JsonKey(name: "developer_name") String? developerName,
      @JsonKey(name: "privacy_policy_url") String? privacyPolicyUrl,
      @JsonKey(name: "website_url") String? websiteUrl,
      @JsonKey(name: "release_notes") String? releaseNotes,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class _$GetFormCopyWithImpl<$Res, $Val extends GetForm>
    implements $GetFormCopyWith<$Res> {
  _$GetFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? appName = freezed,
    Object? appDescription = freezed,
    Object? appVersion = freezed,
    Object? apkFile = freezed,
    Object? appIcon = freezed,
    Object? packageName = freezed,
    Object? category = freezed,
    Object? longDescription = freezed,
    Object? ratings = freezed,
    Object? rated = freezed,
    Object? screenshot1 = freezed,
    Object? screenshot2 = freezed,
    Object? screenshot3 = freezed,
    Object? screenshot4 = freezed,
    Object? screenshot5 = freezed,
    Object? sizeMb = freezed,
    Object? developerName = freezed,
    Object? privacyPolicyUrl = freezed,
    Object? websiteUrl = freezed,
    Object? releaseNotes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appDescription: freezed == appDescription
          ? _value.appDescription
          : appDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      apkFile: freezed == apkFile
          ? _value.apkFile
          : apkFile // ignore: cast_nullable_to_non_nullable
              as String?,
      appIcon: freezed == appIcon
          ? _value.appIcon
          : appIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot1: freezed == screenshot1
          ? _value.screenshot1
          : screenshot1 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot2: freezed == screenshot2
          ? _value.screenshot2
          : screenshot2 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot3: freezed == screenshot3
          ? _value.screenshot3
          : screenshot3 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot4: freezed == screenshot4
          ? _value.screenshot4
          : screenshot4 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot5: freezed == screenshot5
          ? _value.screenshot5
          : screenshot5 // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeMb: freezed == sizeMb
          ? _value.sizeMb
          : sizeMb // ignore: cast_nullable_to_non_nullable
              as int?,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicyUrl: freezed == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseNotes: freezed == releaseNotes
          ? _value.releaseNotes
          : releaseNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFormImplCopyWith<$Res> implements $GetFormCopyWith<$Res> {
  factory _$$GetFormImplCopyWith(
          _$GetFormImpl value, $Res Function(_$GetFormImpl) then) =
      __$$GetFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "app_name") String? appName,
      @JsonKey(name: "app_description") String? appDescription,
      @JsonKey(name: "app_version") String? appVersion,
      @JsonKey(name: "apk_file") String? apkFile,
      @JsonKey(name: "app_icon") String? appIcon,
      @JsonKey(name: "package_name") String? packageName,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "long_description") String? longDescription,
      @JsonKey(name: "ratings") int? ratings,
      @JsonKey(name: "rated") String? rated,
      @JsonKey(name: "screenshot1") String? screenshot1,
      @JsonKey(name: "screenshot2") String? screenshot2,
      @JsonKey(name: "screenshot3") String? screenshot3,
      @JsonKey(name: "screenshot4") String? screenshot4,
      @JsonKey(name: "screenshot5") String? screenshot5,
      @JsonKey(name: "size_mb") int? sizeMb,
      @JsonKey(name: "developer_name") String? developerName,
      @JsonKey(name: "privacy_policy_url") String? privacyPolicyUrl,
      @JsonKey(name: "website_url") String? websiteUrl,
      @JsonKey(name: "release_notes") String? releaseNotes,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class __$$GetFormImplCopyWithImpl<$Res>
    extends _$GetFormCopyWithImpl<$Res, _$GetFormImpl>
    implements _$$GetFormImplCopyWith<$Res> {
  __$$GetFormImplCopyWithImpl(
      _$GetFormImpl _value, $Res Function(_$GetFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? appName = freezed,
    Object? appDescription = freezed,
    Object? appVersion = freezed,
    Object? apkFile = freezed,
    Object? appIcon = freezed,
    Object? packageName = freezed,
    Object? category = freezed,
    Object? longDescription = freezed,
    Object? ratings = freezed,
    Object? rated = freezed,
    Object? screenshot1 = freezed,
    Object? screenshot2 = freezed,
    Object? screenshot3 = freezed,
    Object? screenshot4 = freezed,
    Object? screenshot5 = freezed,
    Object? sizeMb = freezed,
    Object? developerName = freezed,
    Object? privacyPolicyUrl = freezed,
    Object? websiteUrl = freezed,
    Object? releaseNotes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$GetFormImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appDescription: freezed == appDescription
          ? _value.appDescription
          : appDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      apkFile: freezed == apkFile
          ? _value.apkFile
          : apkFile // ignore: cast_nullable_to_non_nullable
              as String?,
      appIcon: freezed == appIcon
          ? _value.appIcon
          : appIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot1: freezed == screenshot1
          ? _value.screenshot1
          : screenshot1 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot2: freezed == screenshot2
          ? _value.screenshot2
          : screenshot2 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot3: freezed == screenshot3
          ? _value.screenshot3
          : screenshot3 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot4: freezed == screenshot4
          ? _value.screenshot4
          : screenshot4 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshot5: freezed == screenshot5
          ? _value.screenshot5
          : screenshot5 // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeMb: freezed == sizeMb
          ? _value.sizeMb
          : sizeMb // ignore: cast_nullable_to_non_nullable
              as int?,
      developerName: freezed == developerName
          ? _value.developerName
          : developerName // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicyUrl: freezed == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseNotes: freezed == releaseNotes
          ? _value.releaseNotes
          : releaseNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFormImpl implements _GetForm {
  const _$GetFormImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "app_name") this.appName,
      @JsonKey(name: "app_description") this.appDescription,
      @JsonKey(name: "app_version") this.appVersion,
      @JsonKey(name: "apk_file") this.apkFile,
      @JsonKey(name: "app_icon") this.appIcon,
      @JsonKey(name: "package_name") this.packageName,
      @JsonKey(name: "category") this.category,
      @JsonKey(name: "long_description") this.longDescription,
      @JsonKey(name: "ratings") this.ratings,
      @JsonKey(name: "rated") this.rated,
      @JsonKey(name: "screenshot1") this.screenshot1,
      @JsonKey(name: "screenshot2") this.screenshot2,
      @JsonKey(name: "screenshot3") this.screenshot3,
      @JsonKey(name: "screenshot4") this.screenshot4,
      @JsonKey(name: "screenshot5") this.screenshot5,
      @JsonKey(name: "size_mb") this.sizeMb,
      @JsonKey(name: "developer_name") this.developerName,
      @JsonKey(name: "privacy_policy_url") this.privacyPolicyUrl,
      @JsonKey(name: "website_url") this.websiteUrl,
      @JsonKey(name: "release_notes") this.releaseNotes,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$GetFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFormImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "app_name")
  final String? appName;
  @override
  @JsonKey(name: "app_description")
  final String? appDescription;
  @override
  @JsonKey(name: "app_version")
  final String? appVersion;
  @override
  @JsonKey(name: "apk_file")
  final String? apkFile;
  @override
  @JsonKey(name: "app_icon")
  final String? appIcon;
  @override
  @JsonKey(name: "package_name")
  final String? packageName;
  @override
  @JsonKey(name: "category")
  final String? category;
  @override
  @JsonKey(name: "long_description")
  final String? longDescription;
  @override
  @JsonKey(name: "ratings")
  final int? ratings;
  @override
  @JsonKey(name: "rated")
  final String? rated;
  @override
  @JsonKey(name: "screenshot1")
  final String? screenshot1;
  @override
  @JsonKey(name: "screenshot2")
  final String? screenshot2;
  @override
  @JsonKey(name: "screenshot3")
  final String? screenshot3;
  @override
  @JsonKey(name: "screenshot4")
  final String? screenshot4;
  @override
  @JsonKey(name: "screenshot5")
  final String? screenshot5;
  @override
  @JsonKey(name: "size_mb")
  final int? sizeMb;
  @override
  @JsonKey(name: "developer_name")
  final String? developerName;
  @override
  @JsonKey(name: "privacy_policy_url")
  final String? privacyPolicyUrl;
  @override
  @JsonKey(name: "website_url")
  final String? websiteUrl;
  @override
  @JsonKey(name: "release_notes")
  final String? releaseNotes;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @override
  String toString() {
    return 'GetForm(id: $id, appName: $appName, appDescription: $appDescription, appVersion: $appVersion, apkFile: $apkFile, appIcon: $appIcon, packageName: $packageName, category: $category, longDescription: $longDescription, ratings: $ratings, rated: $rated, screenshot1: $screenshot1, screenshot2: $screenshot2, screenshot3: $screenshot3, screenshot4: $screenshot4, screenshot5: $screenshot5, sizeMb: $sizeMb, developerName: $developerName, privacyPolicyUrl: $privacyPolicyUrl, websiteUrl: $websiteUrl, releaseNotes: $releaseNotes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appDescription, appDescription) ||
                other.appDescription == appDescription) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.apkFile, apkFile) || other.apkFile == apkFile) &&
            (identical(other.appIcon, appIcon) || other.appIcon == appIcon) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.rated, rated) || other.rated == rated) &&
            (identical(other.screenshot1, screenshot1) ||
                other.screenshot1 == screenshot1) &&
            (identical(other.screenshot2, screenshot2) ||
                other.screenshot2 == screenshot2) &&
            (identical(other.screenshot3, screenshot3) ||
                other.screenshot3 == screenshot3) &&
            (identical(other.screenshot4, screenshot4) ||
                other.screenshot4 == screenshot4) &&
            (identical(other.screenshot5, screenshot5) ||
                other.screenshot5 == screenshot5) &&
            (identical(other.sizeMb, sizeMb) || other.sizeMb == sizeMb) &&
            (identical(other.developerName, developerName) ||
                other.developerName == developerName) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.releaseNotes, releaseNotes) ||
                other.releaseNotes == releaseNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        appName,
        appDescription,
        appVersion,
        apkFile,
        appIcon,
        packageName,
        category,
        longDescription,
        ratings,
        rated,
        screenshot1,
        screenshot2,
        screenshot3,
        screenshot4,
        screenshot5,
        sizeMb,
        developerName,
        privacyPolicyUrl,
        websiteUrl,
        releaseNotes,
        createdAt
      ]);

  /// Create a copy of GetForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFormImplCopyWith<_$GetFormImpl> get copyWith =>
      __$$GetFormImplCopyWithImpl<_$GetFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFormImplToJson(
      this,
    );
  }
}

abstract class _GetForm implements GetForm {
  const factory _GetForm(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "app_name") final String? appName,
      @JsonKey(name: "app_description") final String? appDescription,
      @JsonKey(name: "app_version") final String? appVersion,
      @JsonKey(name: "apk_file") final String? apkFile,
      @JsonKey(name: "app_icon") final String? appIcon,
      @JsonKey(name: "package_name") final String? packageName,
      @JsonKey(name: "category") final String? category,
      @JsonKey(name: "long_description") final String? longDescription,
      @JsonKey(name: "ratings") final int? ratings,
      @JsonKey(name: "rated") final String? rated,
      @JsonKey(name: "screenshot1") final String? screenshot1,
      @JsonKey(name: "screenshot2") final String? screenshot2,
      @JsonKey(name: "screenshot3") final String? screenshot3,
      @JsonKey(name: "screenshot4") final String? screenshot4,
      @JsonKey(name: "screenshot5") final String? screenshot5,
      @JsonKey(name: "size_mb") final int? sizeMb,
      @JsonKey(name: "developer_name") final String? developerName,
      @JsonKey(name: "privacy_policy_url") final String? privacyPolicyUrl,
      @JsonKey(name: "website_url") final String? websiteUrl,
      @JsonKey(name: "release_notes") final String? releaseNotes,
      @JsonKey(name: "created_at") final DateTime? createdAt}) = _$GetFormImpl;

  factory _GetForm.fromJson(Map<String, dynamic> json) = _$GetFormImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "app_name")
  String? get appName;
  @override
  @JsonKey(name: "app_description")
  String? get appDescription;
  @override
  @JsonKey(name: "app_version")
  String? get appVersion;
  @override
  @JsonKey(name: "apk_file")
  String? get apkFile;
  @override
  @JsonKey(name: "app_icon")
  String? get appIcon;
  @override
  @JsonKey(name: "package_name")
  String? get packageName;
  @override
  @JsonKey(name: "category")
  String? get category;
  @override
  @JsonKey(name: "long_description")
  String? get longDescription;
  @override
  @JsonKey(name: "ratings")
  int? get ratings;
  @override
  @JsonKey(name: "rated")
  String? get rated;
  @override
  @JsonKey(name: "screenshot1")
  String? get screenshot1;
  @override
  @JsonKey(name: "screenshot2")
  String? get screenshot2;
  @override
  @JsonKey(name: "screenshot3")
  String? get screenshot3;
  @override
  @JsonKey(name: "screenshot4")
  String? get screenshot4;
  @override
  @JsonKey(name: "screenshot5")
  String? get screenshot5;
  @override
  @JsonKey(name: "size_mb")
  int? get sizeMb;
  @override
  @JsonKey(name: "developer_name")
  String? get developerName;
  @override
  @JsonKey(name: "privacy_policy_url")
  String? get privacyPolicyUrl;
  @override
  @JsonKey(name: "website_url")
  String? get websiteUrl;
  @override
  @JsonKey(name: "release_notes")
  String? get releaseNotes;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;

  /// Create a copy of GetForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFormImplCopyWith<_$GetFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  @JsonKey(name: "current_page")
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "total_apps")
  int? get totalApps => throw _privateConstructorUsedError;
  @JsonKey(name: "has_next")
  bool? get hasNext => throw _privateConstructorUsedError;
  @JsonKey(name: "has_previous")
  bool? get hasPrevious => throw _privateConstructorUsedError;

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      @JsonKey(name: "total_pages") int? totalPages,
      @JsonKey(name: "total_apps") int? totalApps,
      @JsonKey(name: "has_next") bool? hasNext,
      @JsonKey(name: "has_previous") bool? hasPrevious});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? totalPages = freezed,
    Object? totalApps = freezed,
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalApps: freezed == totalApps
          ? _value.totalApps
          : totalApps // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrevious: freezed == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "current_page") int? currentPage,
      @JsonKey(name: "total_pages") int? totalPages,
      @JsonKey(name: "total_apps") int? totalApps,
      @JsonKey(name: "has_next") bool? hasNext,
      @JsonKey(name: "has_previous") bool? hasPrevious});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? totalPages = freezed,
    Object? totalApps = freezed,
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
  }) {
    return _then(_$PaginationImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalApps: freezed == totalApps
          ? _value.totalApps
          : totalApps // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrevious: freezed == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {@JsonKey(name: "current_page") this.currentPage,
      @JsonKey(name: "total_pages") this.totalPages,
      @JsonKey(name: "total_apps") this.totalApps,
      @JsonKey(name: "has_next") this.hasNext,
      @JsonKey(name: "has_previous") this.hasPrevious});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  @override
  @JsonKey(name: "current_page")
  final int? currentPage;
  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @override
  @JsonKey(name: "total_apps")
  final int? totalApps;
  @override
  @JsonKey(name: "has_next")
  final bool? hasNext;
  @override
  @JsonKey(name: "has_previous")
  final bool? hasPrevious;

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, totalPages: $totalPages, totalApps: $totalApps, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalApps, totalApps) ||
                other.totalApps == totalApps) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, totalPages, totalApps, hasNext, hasPrevious);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
          {@JsonKey(name: "current_page") final int? currentPage,
          @JsonKey(name: "total_pages") final int? totalPages,
          @JsonKey(name: "total_apps") final int? totalApps,
          @JsonKey(name: "has_next") final bool? hasNext,
          @JsonKey(name: "has_previous") final bool? hasPrevious}) =
      _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  @JsonKey(name: "current_page")
  int? get currentPage;
  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  @JsonKey(name: "total_apps")
  int? get totalApps;
  @override
  @JsonKey(name: "has_next")
  bool? get hasNext;
  @override
  @JsonKey(name: "has_previous")
  bool? get hasPrevious;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
