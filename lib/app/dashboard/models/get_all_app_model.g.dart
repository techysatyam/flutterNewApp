// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllAppModelImpl _$$GetAllAppModelImplFromJson(Map<String, dynamic> json) =>
    _$GetAllAppModelImpl(
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetAllAppModelImplToJson(
        _$GetAllAppModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'pagination': instance.pagination,
    };

_$GetFormImpl _$$GetFormImplFromJson(Map<String, dynamic> json) =>
    _$GetFormImpl(
      id: (json['id'] as num?)?.toInt(),
      appName: json['app_name'] as String?,
      appDescription: json['app_description'] as String?,
      appVersion: json['app_version'] as String?,
      apkFile: json['apk_file'] as String?,
      appIcon: json['app_icon'] as String?,
      packageName: json['package_name'] as String?,
      category: json['category'] as String?,
      longDescription: json['long_description'] as String?,
      ratings: (json['ratings'] as num?)?.toInt(),
      rated: json['rated'] as String?,
      screenshot1: json['screenshot1'] as String?,
      screenshot2: json['screenshot2'] as String?,
      screenshot3: json['screenshot3'] as String?,
      screenshot4: json['screenshot4'] as String?,
      screenshot5: json['screenshot5'] as String?,
      sizeMb: (json['size_mb'] as num?)?.toInt(),
      developerName: json['developer_name'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      releaseNotes: json['release_notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$GetFormImplToJson(_$GetFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_name': instance.appName,
      'app_description': instance.appDescription,
      'app_version': instance.appVersion,
      'apk_file': instance.apkFile,
      'app_icon': instance.appIcon,
      'package_name': instance.packageName,
      'category': instance.category,
      'long_description': instance.longDescription,
      'ratings': instance.ratings,
      'rated': instance.rated,
      'screenshot1': instance.screenshot1,
      'screenshot2': instance.screenshot2,
      'screenshot3': instance.screenshot3,
      'screenshot4': instance.screenshot4,
      'screenshot5': instance.screenshot5,
      'size_mb': instance.sizeMb,
      'developer_name': instance.developerName,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'website_url': instance.websiteUrl,
      'release_notes': instance.releaseNotes,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalApps: (json['total_apps'] as num?)?.toInt(),
      hasNext: json['has_next'] as bool?,
      hasPrevious: json['has_previous'] as bool?,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'total_apps': instance.totalApps,
      'has_next': instance.hasNext,
      'has_previous': instance.hasPrevious,
    };
