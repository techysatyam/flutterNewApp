// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddAppDataModelImpl _$$AddAppDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddAppDataModelImpl(
      appName: json['app_name'] as String?,
      appDescription: json['app_description'] as String?,
      appVersion: json['app_version'] as String?,
      packageName: json['package_name'] as String?,
      category: json['category'] as String?,
      developerName: json['developer_name'] as String?,
      releaseNotes: json['release_notes'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      websiteUrl: json['website_url'] as String?,
    );

Map<String, dynamic> _$$AddAppDataModelImplToJson(
        _$AddAppDataModelImpl instance) =>
    <String, dynamic>{
      'app_name': instance.appName,
      'app_description': instance.appDescription,
      'app_version': instance.appVersion,
      'package_name': instance.packageName,
      'category': instance.category,
      'developer_name': instance.developerName,
      'release_notes': instance.releaseNotes,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'website_url': instance.websiteUrl,
    };
