// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetFormImplCopyWith<$Res> {
  factory _$$GetFormImplCopyWith(
          _$GetFormImpl value, $Res Function(_$GetFormImpl) then) =
      __$$GetFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pageNumber, bool? loadMore});
}

/// @nodoc
class __$$GetFormImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$GetFormImpl>
    implements _$$GetFormImplCopyWith<$Res> {
  __$$GetFormImplCopyWithImpl(
      _$GetFormImpl _value, $Res Function(_$GetFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? loadMore = freezed,
  }) {
    return _then(_$GetFormImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      loadMore: freezed == loadMore
          ? _value.loadMore
          : loadMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$GetFormImpl implements _GetForm {
  const _$GetFormImpl({this.pageNumber = 1, this.loadMore = false});

  @override
  @JsonKey()
  final int pageNumber;
  @override
  @JsonKey()
  final bool? loadMore;

  @override
  String toString() {
    return 'DashboardEvent.getForm(pageNumber: $pageNumber, loadMore: $loadMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFormImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.loadMore, loadMore) ||
                other.loadMore == loadMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, loadMore);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFormImplCopyWith<_$GetFormImpl> get copyWith =>
      __$$GetFormImplCopyWithImpl<_$GetFormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return getForm(pageNumber, loadMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return getForm?.call(pageNumber, loadMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (getForm != null) {
      return getForm(pageNumber, loadMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return getForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return getForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (getForm != null) {
      return getForm(this);
    }
    return orElse();
  }
}

abstract class _GetForm implements DashboardEvent {
  const factory _GetForm({final int pageNumber, final bool? loadMore}) =
      _$GetFormImpl;

  int get pageNumber;
  bool? get loadMore;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFormImplCopyWith<_$GetFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddFormImplCopyWith<$Res> {
  factory _$$AddFormImplCopyWith(
          _$AddFormImpl value, $Res Function(_$AddFormImpl) then) =
      __$$AddFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddFormImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$AddFormImpl>
    implements _$$AddFormImplCopyWith<$Res> {
  __$$AddFormImplCopyWithImpl(
      _$AddFormImpl _value, $Res Function(_$AddFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddFormImpl implements _AddForm {
  const _$AddFormImpl();

  @override
  String toString() {
    return 'DashboardEvent.addForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return addForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return addForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (addForm != null) {
      return addForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return addForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return addForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (addForm != null) {
      return addForm(this);
    }
    return orElse();
  }
}

abstract class _AddForm implements DashboardEvent {
  const factory _AddForm() = _$AddFormImpl;
}

/// @nodoc
abstract class _$$UploadApkImplCopyWith<$Res> {
  factory _$$UploadApkImplCopyWith(
          _$UploadApkImpl value, $Res Function(_$UploadApkImpl) then) =
      __$$UploadApkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadApkImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$UploadApkImpl>
    implements _$$UploadApkImplCopyWith<$Res> {
  __$$UploadApkImplCopyWithImpl(
      _$UploadApkImpl _value, $Res Function(_$UploadApkImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadApkImpl implements _UploadApk {
  const _$UploadApkImpl();

  @override
  String toString() {
    return 'DashboardEvent.uploadApk()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadApkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return uploadApk();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return uploadApk?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (uploadApk != null) {
      return uploadApk();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return uploadApk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return uploadApk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (uploadApk != null) {
      return uploadApk(this);
    }
    return orElse();
  }
}

abstract class _UploadApk implements DashboardEvent {
  const factory _UploadApk() = _$UploadApkImpl;
}

/// @nodoc
abstract class _$$SelectFileImplCopyWith<$Res> {
  factory _$$SelectFileImplCopyWith(
          _$SelectFileImpl value, $Res Function(_$SelectFileImpl) then) =
      __$$SelectFileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectFileImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$SelectFileImpl>
    implements _$$SelectFileImplCopyWith<$Res> {
  __$$SelectFileImplCopyWithImpl(
      _$SelectFileImpl _value, $Res Function(_$SelectFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SelectFileImpl implements _SelectFile {
  const _$SelectFileImpl();

  @override
  String toString() {
    return 'DashboardEvent.selectFile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectFileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return selectFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return selectFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return selectFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return selectFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectFile != null) {
      return selectFile(this);
    }
    return orElse();
  }
}

abstract class _SelectFile implements DashboardEvent {
  const factory _SelectFile() = _$SelectFileImpl;
}

/// @nodoc
abstract class _$$SelectImageImplCopyWith<$Res> {
  factory _$$SelectImageImplCopyWith(
          _$SelectImageImpl value, $Res Function(_$SelectImageImpl) then) =
      __$$SelectImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectImageImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$SelectImageImpl>
    implements _$$SelectImageImplCopyWith<$Res> {
  __$$SelectImageImplCopyWithImpl(
      _$SelectImageImpl _value, $Res Function(_$SelectImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SelectImageImpl implements _SelectImage {
  const _$SelectImageImpl();

  @override
  String toString() {
    return 'DashboardEvent.selectImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return selectImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return selectImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return selectImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return selectImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage(this);
    }
    return orElse();
  }
}

abstract class _SelectImage implements DashboardEvent {
  const factory _SelectImage() = _$SelectImageImpl;
}

/// @nodoc
abstract class _$$SelectIconImplCopyWith<$Res> {
  factory _$$SelectIconImplCopyWith(
          _$SelectIconImpl value, $Res Function(_$SelectIconImpl) then) =
      __$$SelectIconImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectIconImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$SelectIconImpl>
    implements _$$SelectIconImplCopyWith<$Res> {
  __$$SelectIconImplCopyWithImpl(
      _$SelectIconImpl _value, $Res Function(_$SelectIconImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SelectIconImpl implements _SelectIcon {
  const _$SelectIconImpl();

  @override
  String toString() {
    return 'DashboardEvent.selectIcon()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectIconImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return selectIcon();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return selectIcon?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectIcon != null) {
      return selectIcon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return selectIcon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return selectIcon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (selectIcon != null) {
      return selectIcon(this);
    }
    return orElse();
  }
}

abstract class _SelectIcon implements DashboardEvent {
  const factory _SelectIcon() = _$SelectIconImpl;
}

/// @nodoc
abstract class _$$RemoveLastScreenshotImplCopyWith<$Res> {
  factory _$$RemoveLastScreenshotImplCopyWith(_$RemoveLastScreenshotImpl value,
          $Res Function(_$RemoveLastScreenshotImpl) then) =
      __$$RemoveLastScreenshotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveLastScreenshotImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$RemoveLastScreenshotImpl>
    implements _$$RemoveLastScreenshotImplCopyWith<$Res> {
  __$$RemoveLastScreenshotImplCopyWithImpl(_$RemoveLastScreenshotImpl _value,
      $Res Function(_$RemoveLastScreenshotImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveLastScreenshotImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveLastScreenshotImpl implements _RemoveLastScreenshot {
  const _$RemoveLastScreenshotImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'DashboardEvent.removeLastScreenshot(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveLastScreenshotImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveLastScreenshotImplCopyWith<_$RemoveLastScreenshotImpl>
      get copyWith =>
          __$$RemoveLastScreenshotImplCopyWithImpl<_$RemoveLastScreenshotImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return removeLastScreenshot(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return removeLastScreenshot?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (removeLastScreenshot != null) {
      return removeLastScreenshot(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return removeLastScreenshot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return removeLastScreenshot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (removeLastScreenshot != null) {
      return removeLastScreenshot(this);
    }
    return orElse();
  }
}

abstract class _RemoveLastScreenshot implements DashboardEvent {
  const factory _RemoveLastScreenshot(final int index) =
      _$RemoveLastScreenshotImpl;

  int get index;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveLastScreenshotImplCopyWith<_$RemoveLastScreenshotImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckIfAppInstalledImplCopyWith<$Res> {
  factory _$$CheckIfAppInstalledImplCopyWith(_$CheckIfAppInstalledImpl value,
          $Res Function(_$CheckIfAppInstalledImpl) then) =
      __$$CheckIfAppInstalledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String packageName});
}

/// @nodoc
class __$$CheckIfAppInstalledImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$CheckIfAppInstalledImpl>
    implements _$$CheckIfAppInstalledImplCopyWith<$Res> {
  __$$CheckIfAppInstalledImplCopyWithImpl(_$CheckIfAppInstalledImpl _value,
      $Res Function(_$CheckIfAppInstalledImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
  }) {
    return _then(_$CheckIfAppInstalledImpl(
      null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckIfAppInstalledImpl implements _CheckIfAppInstalled {
  const _$CheckIfAppInstalledImpl(this.packageName);

  @override
  final String packageName;

  @override
  String toString() {
    return 'DashboardEvent.checkIfAppInstalled(packageName: $packageName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIfAppInstalledImpl &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packageName);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckIfAppInstalledImplCopyWith<_$CheckIfAppInstalledImpl> get copyWith =>
      __$$CheckIfAppInstalledImplCopyWithImpl<_$CheckIfAppInstalledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNumber, bool? loadMore) getForm,
    required TResult Function() addForm,
    required TResult Function() uploadApk,
    required TResult Function() selectFile,
    required TResult Function() selectImage,
    required TResult Function() selectIcon,
    required TResult Function(int index) removeLastScreenshot,
    required TResult Function(String packageName) checkIfAppInstalled,
  }) {
    return checkIfAppInstalled(packageName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageNumber, bool? loadMore)? getForm,
    TResult? Function()? addForm,
    TResult? Function()? uploadApk,
    TResult? Function()? selectFile,
    TResult? Function()? selectImage,
    TResult? Function()? selectIcon,
    TResult? Function(int index)? removeLastScreenshot,
    TResult? Function(String packageName)? checkIfAppInstalled,
  }) {
    return checkIfAppInstalled?.call(packageName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNumber, bool? loadMore)? getForm,
    TResult Function()? addForm,
    TResult Function()? uploadApk,
    TResult Function()? selectFile,
    TResult Function()? selectImage,
    TResult Function()? selectIcon,
    TResult Function(int index)? removeLastScreenshot,
    TResult Function(String packageName)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (checkIfAppInstalled != null) {
      return checkIfAppInstalled(packageName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetForm value) getForm,
    required TResult Function(_AddForm value) addForm,
    required TResult Function(_UploadApk value) uploadApk,
    required TResult Function(_SelectFile value) selectFile,
    required TResult Function(_SelectImage value) selectImage,
    required TResult Function(_SelectIcon value) selectIcon,
    required TResult Function(_RemoveLastScreenshot value) removeLastScreenshot,
    required TResult Function(_CheckIfAppInstalled value) checkIfAppInstalled,
  }) {
    return checkIfAppInstalled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetForm value)? getForm,
    TResult? Function(_AddForm value)? addForm,
    TResult? Function(_UploadApk value)? uploadApk,
    TResult? Function(_SelectFile value)? selectFile,
    TResult? Function(_SelectImage value)? selectImage,
    TResult? Function(_SelectIcon value)? selectIcon,
    TResult? Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult? Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
  }) {
    return checkIfAppInstalled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetForm value)? getForm,
    TResult Function(_AddForm value)? addForm,
    TResult Function(_UploadApk value)? uploadApk,
    TResult Function(_SelectFile value)? selectFile,
    TResult Function(_SelectImage value)? selectImage,
    TResult Function(_SelectIcon value)? selectIcon,
    TResult Function(_RemoveLastScreenshot value)? removeLastScreenshot,
    TResult Function(_CheckIfAppInstalled value)? checkIfAppInstalled,
    required TResult orElse(),
  }) {
    if (checkIfAppInstalled != null) {
      return checkIfAppInstalled(this);
    }
    return orElse();
  }
}

abstract class _CheckIfAppInstalled implements DashboardEvent {
  const factory _CheckIfAppInstalled(final String packageName) =
      _$CheckIfAppInstalledImpl;

  String get packageName;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckIfAppInstalledImplCopyWith<_$CheckIfAppInstalledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardState {
  AppStoreRepo get appStoreRepo => throw _privateConstructorUsedError;
  Map<String, bool> get installedAppsMap => throw _privateConstructorUsedError;
  DashBoardStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  List<ScreenshotFile> get screenshots => throw _privateConstructorUsedError;
  String? get apkBase64 => throw _privateConstructorUsedError;
  String? get iconBase64 => throw _privateConstructorUsedError;
  String? get screenshotBase64 => throw _privateConstructorUsedError;
  AddAppDataModel? get addAppDataModel => throw _privateConstructorUsedError;
  GetAllAppModel? get getAllAppModel => throw _privateConstructorUsedError;
  XFile? get iconImage => throw _privateConstructorUsedError;
  XFile? get screenshot => throw _privateConstructorUsedError;
  String? get selectedFileName => throw _privateConstructorUsedError;
  String? get selectedIconName => throw _privateConstructorUsedError;
  String? get selectedScreenshotName => throw _privateConstructorUsedError;
  String get selectedFileErrorMessage =>
      throw _privateConstructorUsedError; // Added for scroll pagination
  bool get isFetchingMore =>
      throw _privateConstructorUsedError; // Optional: To indicate end of data
  bool get hasMoreData => throw _privateConstructorUsedError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {AppStoreRepo appStoreRepo,
      Map<String, bool> installedAppsMap,
      DashBoardStatus status,
      String message,
      int pageNumber,
      List<ScreenshotFile> screenshots,
      String? apkBase64,
      String? iconBase64,
      String? screenshotBase64,
      AddAppDataModel? addAppDataModel,
      GetAllAppModel? getAllAppModel,
      XFile? iconImage,
      XFile? screenshot,
      String? selectedFileName,
      String? selectedIconName,
      String? selectedScreenshotName,
      String selectedFileErrorMessage,
      bool isFetchingMore,
      bool hasMoreData});

  $AddAppDataModelCopyWith<$Res>? get addAppDataModel;
  $GetAllAppModelCopyWith<$Res>? get getAllAppModel;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appStoreRepo = null,
    Object? installedAppsMap = null,
    Object? status = null,
    Object? message = null,
    Object? pageNumber = null,
    Object? screenshots = null,
    Object? apkBase64 = freezed,
    Object? iconBase64 = freezed,
    Object? screenshotBase64 = freezed,
    Object? addAppDataModel = freezed,
    Object? getAllAppModel = freezed,
    Object? iconImage = freezed,
    Object? screenshot = freezed,
    Object? selectedFileName = freezed,
    Object? selectedIconName = freezed,
    Object? selectedScreenshotName = freezed,
    Object? selectedFileErrorMessage = null,
    Object? isFetchingMore = null,
    Object? hasMoreData = null,
  }) {
    return _then(_value.copyWith(
      appStoreRepo: null == appStoreRepo
          ? _value.appStoreRepo
          : appStoreRepo // ignore: cast_nullable_to_non_nullable
              as AppStoreRepo,
      installedAppsMap: null == installedAppsMap
          ? _value.installedAppsMap
          : installedAppsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashBoardStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      screenshots: null == screenshots
          ? _value.screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<ScreenshotFile>,
      apkBase64: freezed == apkBase64
          ? _value.apkBase64
          : apkBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBase64: freezed == iconBase64
          ? _value.iconBase64
          : iconBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshotBase64: freezed == screenshotBase64
          ? _value.screenshotBase64
          : screenshotBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      addAppDataModel: freezed == addAppDataModel
          ? _value.addAppDataModel
          : addAppDataModel // ignore: cast_nullable_to_non_nullable
              as AddAppDataModel?,
      getAllAppModel: freezed == getAllAppModel
          ? _value.getAllAppModel
          : getAllAppModel // ignore: cast_nullable_to_non_nullable
              as GetAllAppModel?,
      iconImage: freezed == iconImage
          ? _value.iconImage
          : iconImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      screenshot: freezed == screenshot
          ? _value.screenshot
          : screenshot // ignore: cast_nullable_to_non_nullable
              as XFile?,
      selectedFileName: freezed == selectedFileName
          ? _value.selectedFileName
          : selectedFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIconName: freezed == selectedIconName
          ? _value.selectedIconName
          : selectedIconName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedScreenshotName: freezed == selectedScreenshotName
          ? _value.selectedScreenshotName
          : selectedScreenshotName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedFileErrorMessage: null == selectedFileErrorMessage
          ? _value.selectedFileErrorMessage
          : selectedFileErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isFetchingMore: null == isFetchingMore
          ? _value.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddAppDataModelCopyWith<$Res>? get addAppDataModel {
    if (_value.addAppDataModel == null) {
      return null;
    }

    return $AddAppDataModelCopyWith<$Res>(_value.addAppDataModel!, (value) {
      return _then(_value.copyWith(addAppDataModel: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllAppModelCopyWith<$Res>? get getAllAppModel {
    if (_value.getAllAppModel == null) {
      return null;
    }

    return $GetAllAppModelCopyWith<$Res>(_value.getAllAppModel!, (value) {
      return _then(_value.copyWith(getAllAppModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppStoreRepo appStoreRepo,
      Map<String, bool> installedAppsMap,
      DashBoardStatus status,
      String message,
      int pageNumber,
      List<ScreenshotFile> screenshots,
      String? apkBase64,
      String? iconBase64,
      String? screenshotBase64,
      AddAppDataModel? addAppDataModel,
      GetAllAppModel? getAllAppModel,
      XFile? iconImage,
      XFile? screenshot,
      String? selectedFileName,
      String? selectedIconName,
      String? selectedScreenshotName,
      String selectedFileErrorMessage,
      bool isFetchingMore,
      bool hasMoreData});

  @override
  $AddAppDataModelCopyWith<$Res>? get addAppDataModel;
  @override
  $GetAllAppModelCopyWith<$Res>? get getAllAppModel;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appStoreRepo = null,
    Object? installedAppsMap = null,
    Object? status = null,
    Object? message = null,
    Object? pageNumber = null,
    Object? screenshots = null,
    Object? apkBase64 = freezed,
    Object? iconBase64 = freezed,
    Object? screenshotBase64 = freezed,
    Object? addAppDataModel = freezed,
    Object? getAllAppModel = freezed,
    Object? iconImage = freezed,
    Object? screenshot = freezed,
    Object? selectedFileName = freezed,
    Object? selectedIconName = freezed,
    Object? selectedScreenshotName = freezed,
    Object? selectedFileErrorMessage = null,
    Object? isFetchingMore = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$DashboardStateImpl(
      appStoreRepo: null == appStoreRepo
          ? _value.appStoreRepo
          : appStoreRepo // ignore: cast_nullable_to_non_nullable
              as AppStoreRepo,
      installedAppsMap: null == installedAppsMap
          ? _value._installedAppsMap
          : installedAppsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashBoardStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      screenshots: null == screenshots
          ? _value._screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<ScreenshotFile>,
      apkBase64: freezed == apkBase64
          ? _value.apkBase64
          : apkBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBase64: freezed == iconBase64
          ? _value.iconBase64
          : iconBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshotBase64: freezed == screenshotBase64
          ? _value.screenshotBase64
          : screenshotBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      addAppDataModel: freezed == addAppDataModel
          ? _value.addAppDataModel
          : addAppDataModel // ignore: cast_nullable_to_non_nullable
              as AddAppDataModel?,
      getAllAppModel: freezed == getAllAppModel
          ? _value.getAllAppModel
          : getAllAppModel // ignore: cast_nullable_to_non_nullable
              as GetAllAppModel?,
      iconImage: freezed == iconImage
          ? _value.iconImage
          : iconImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      screenshot: freezed == screenshot
          ? _value.screenshot
          : screenshot // ignore: cast_nullable_to_non_nullable
              as XFile?,
      selectedFileName: freezed == selectedFileName
          ? _value.selectedFileName
          : selectedFileName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIconName: freezed == selectedIconName
          ? _value.selectedIconName
          : selectedIconName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedScreenshotName: freezed == selectedScreenshotName
          ? _value.selectedScreenshotName
          : selectedScreenshotName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedFileErrorMessage: null == selectedFileErrorMessage
          ? _value.selectedFileErrorMessage
          : selectedFileErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isFetchingMore: null == isFetchingMore
          ? _value.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {required this.appStoreRepo,
      final Map<String, bool> installedAppsMap = const {},
      this.status = DashBoardStatus.initial,
      this.message = '',
      this.pageNumber = 1,
      final List<ScreenshotFile> screenshots = const [],
      this.apkBase64,
      this.iconBase64,
      this.screenshotBase64,
      this.addAppDataModel,
      this.getAllAppModel,
      this.iconImage,
      this.screenshot,
      this.selectedFileName,
      this.selectedIconName,
      this.selectedScreenshotName,
      this.selectedFileErrorMessage = '',
      this.isFetchingMore = false,
      this.hasMoreData = true})
      : _installedAppsMap = installedAppsMap,
        _screenshots = screenshots;

  @override
  final AppStoreRepo appStoreRepo;
  final Map<String, bool> _installedAppsMap;
  @override
  @JsonKey()
  Map<String, bool> get installedAppsMap {
    if (_installedAppsMap is EqualUnmodifiableMapView) return _installedAppsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_installedAppsMap);
  }

  @override
  @JsonKey()
  final DashBoardStatus status;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int pageNumber;
  final List<ScreenshotFile> _screenshots;
  @override
  @JsonKey()
  List<ScreenshotFile> get screenshots {
    if (_screenshots is EqualUnmodifiableListView) return _screenshots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_screenshots);
  }

  @override
  final String? apkBase64;
  @override
  final String? iconBase64;
  @override
  final String? screenshotBase64;
  @override
  final AddAppDataModel? addAppDataModel;
  @override
  final GetAllAppModel? getAllAppModel;
  @override
  final XFile? iconImage;
  @override
  final XFile? screenshot;
  @override
  final String? selectedFileName;
  @override
  final String? selectedIconName;
  @override
  final String? selectedScreenshotName;
  @override
  @JsonKey()
  final String selectedFileErrorMessage;
// Added for scroll pagination
  @override
  @JsonKey()
  final bool isFetchingMore;
// Optional: To indicate end of data
  @override
  @JsonKey()
  final bool hasMoreData;

  @override
  String toString() {
    return 'DashboardState(appStoreRepo: $appStoreRepo, installedAppsMap: $installedAppsMap, status: $status, message: $message, pageNumber: $pageNumber, screenshots: $screenshots, apkBase64: $apkBase64, iconBase64: $iconBase64, screenshotBase64: $screenshotBase64, addAppDataModel: $addAppDataModel, getAllAppModel: $getAllAppModel, iconImage: $iconImage, screenshot: $screenshot, selectedFileName: $selectedFileName, selectedIconName: $selectedIconName, selectedScreenshotName: $selectedScreenshotName, selectedFileErrorMessage: $selectedFileErrorMessage, isFetchingMore: $isFetchingMore, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.appStoreRepo, appStoreRepo) ||
                other.appStoreRepo == appStoreRepo) &&
            const DeepCollectionEquality()
                .equals(other._installedAppsMap, _installedAppsMap) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            const DeepCollectionEquality()
                .equals(other._screenshots, _screenshots) &&
            (identical(other.apkBase64, apkBase64) ||
                other.apkBase64 == apkBase64) &&
            (identical(other.iconBase64, iconBase64) ||
                other.iconBase64 == iconBase64) &&
            (identical(other.screenshotBase64, screenshotBase64) ||
                other.screenshotBase64 == screenshotBase64) &&
            (identical(other.addAppDataModel, addAppDataModel) ||
                other.addAppDataModel == addAppDataModel) &&
            (identical(other.getAllAppModel, getAllAppModel) ||
                other.getAllAppModel == getAllAppModel) &&
            (identical(other.iconImage, iconImage) ||
                other.iconImage == iconImage) &&
            (identical(other.screenshot, screenshot) ||
                other.screenshot == screenshot) &&
            (identical(other.selectedFileName, selectedFileName) ||
                other.selectedFileName == selectedFileName) &&
            (identical(other.selectedIconName, selectedIconName) ||
                other.selectedIconName == selectedIconName) &&
            (identical(other.selectedScreenshotName, selectedScreenshotName) ||
                other.selectedScreenshotName == selectedScreenshotName) &&
            (identical(
                    other.selectedFileErrorMessage, selectedFileErrorMessage) ||
                other.selectedFileErrorMessage == selectedFileErrorMessage) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appStoreRepo,
        const DeepCollectionEquality().hash(_installedAppsMap),
        status,
        message,
        pageNumber,
        const DeepCollectionEquality().hash(_screenshots),
        apkBase64,
        iconBase64,
        screenshotBase64,
        addAppDataModel,
        getAllAppModel,
        iconImage,
        screenshot,
        selectedFileName,
        selectedIconName,
        selectedScreenshotName,
        selectedFileErrorMessage,
        isFetchingMore,
        hasMoreData
      ]);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {required final AppStoreRepo appStoreRepo,
      final Map<String, bool> installedAppsMap,
      final DashBoardStatus status,
      final String message,
      final int pageNumber,
      final List<ScreenshotFile> screenshots,
      final String? apkBase64,
      final String? iconBase64,
      final String? screenshotBase64,
      final AddAppDataModel? addAppDataModel,
      final GetAllAppModel? getAllAppModel,
      final XFile? iconImage,
      final XFile? screenshot,
      final String? selectedFileName,
      final String? selectedIconName,
      final String? selectedScreenshotName,
      final String selectedFileErrorMessage,
      final bool isFetchingMore,
      final bool hasMoreData}) = _$DashboardStateImpl;

  @override
  AppStoreRepo get appStoreRepo;
  @override
  Map<String, bool> get installedAppsMap;
  @override
  DashBoardStatus get status;
  @override
  String get message;
  @override
  int get pageNumber;
  @override
  List<ScreenshotFile> get screenshots;
  @override
  String? get apkBase64;
  @override
  String? get iconBase64;
  @override
  String? get screenshotBase64;
  @override
  AddAppDataModel? get addAppDataModel;
  @override
  GetAllAppModel? get getAllAppModel;
  @override
  XFile? get iconImage;
  @override
  XFile? get screenshot;
  @override
  String? get selectedFileName;
  @override
  String? get selectedIconName;
  @override
  String? get selectedScreenshotName;
  @override
  String get selectedFileErrorMessage; // Added for scroll pagination
  @override
  bool get isFetchingMore; // Optional: To indicate end of data
  @override
  bool get hasMoreData;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
