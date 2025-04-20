// To parse this JSON data, do
//
//     final addAppDataModel = addAppDataModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_app_data_model.freezed.dart';
part 'add_app_data_model.g.dart';

AddAppDataModel addAppDataModelFromJson(String str) => AddAppDataModel.fromJson(json.decode(str));

String addAppDataModelToJson(AddAppDataModel data) => json.encode(data.toJson());

@freezed
class AddAppDataModel with _$AddAppDataModel {
  const factory AddAppDataModel({
    @JsonKey(name: "app_name")
    String? appName,
    @JsonKey(name: "app_description")
    String? appDescription,
    @JsonKey(name: "app_version")
    String? appVersion,
    @JsonKey(name: "package_name")
    String? packageName,
    @JsonKey(name: "category")
    String? category,
    @JsonKey(name: "developer_name")
    String? developerName,
    @JsonKey(name: "release_notes")
    String? releaseNotes,
    @JsonKey(name: "privacy_policy_url")
    String? privacyPolicyUrl,
    @JsonKey(name: "website_url")
    String? websiteUrl,
  }) = _AddAppDataModel;

  factory AddAppDataModel.fromJson(Map<String, dynamic> json) => _$AddAppDataModelFromJson(json);
}
