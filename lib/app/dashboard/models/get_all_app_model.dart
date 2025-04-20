// To parse this JSON data, do
//
//     final getAllAppModel = getAllAppModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_all_app_model.freezed.dart';
part 'get_all_app_model.g.dart';

GetAllAppModel getAllAppModelFromJson(String str) => GetAllAppModel.fromJson(json.decode(str));

String getAllAppModelToJson(GetAllAppModel data) => json.encode(data.toJson());

@freezed
class GetAllAppModel with _$GetAllAppModel {
  const factory GetAllAppModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "data")
    List<GetForm>? data,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "pagination")
    Pagination? pagination,
  }) = _GetAllAppModel;

  factory GetAllAppModel.fromJson(Map<String, dynamic> json) => _$GetAllAppModelFromJson(json);
}

@freezed
class GetForm with _$GetForm {
  const factory GetForm({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "app_name")
    String? appName,
    @JsonKey(name: "app_description")
    String? appDescription,
    @JsonKey(name: "app_version")
    String? appVersion,
    @JsonKey(name: "apk_file")
    String? apkFile,
    @JsonKey(name: "app_icon")
    String? appIcon,
    @JsonKey(name: "package_name")
    String? packageName,
    @JsonKey(name: "category")
    String? category,
    @JsonKey(name: "long_description")
    String? longDescription,
    @JsonKey(name: "ratings")
    int? ratings,
    @JsonKey(name: "rated")
    String? rated,
    @JsonKey(name: "screenshot1")
    String? screenshot1,
    @JsonKey(name: "screenshot2")
    String? screenshot2,
    @JsonKey(name: "screenshot3")
    String? screenshot3,
    @JsonKey(name: "screenshot4")
    String? screenshot4,
    @JsonKey(name: "screenshot5")
    String? screenshot5,
    @JsonKey(name: "size_mb")
    int? sizeMb,
    @JsonKey(name: "developer_name")
    String? developerName,
    @JsonKey(name: "privacy_policy_url")
    String? privacyPolicyUrl,
    @JsonKey(name: "website_url")
    String? websiteUrl,
    @JsonKey(name: "release_notes")
    String? releaseNotes,
    @JsonKey(name: "created_at")
    DateTime? createdAt,
  }) = _GetForm;

  factory GetForm.fromJson(Map<String, dynamic> json) => _$GetFormFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: "current_page")
    int? currentPage,
    @JsonKey(name: "total_pages")
    int? totalPages,
    @JsonKey(name: "total_apps")
    int? totalApps,
    @JsonKey(name: "has_next")
    bool? hasNext,
    @JsonKey(name: "has_previous")
    bool? hasPrevious,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
