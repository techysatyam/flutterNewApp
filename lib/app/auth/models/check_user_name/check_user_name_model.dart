// To parse this JSON data, do
//
//     final checkUserNameModel = checkUserNameModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'check_user_name_model.freezed.dart';

part 'check_user_name_model.g.dart';

CheckUserNameModel checkUserNameModelFromJson(String str) =>
    CheckUserNameModel.fromJson(json.decode(str));

String checkUserNameModelToJson(CheckUserNameModel data) =>
    json.encode(data.toJson());

@freezed
class CheckUserNameModel with _$CheckUserNameModel {
  const factory CheckUserNameModel({
    @JsonKey(name: "reqId") String? reqId,
  }) = _CheckUserNameModel;

  factory CheckUserNameModel.fromJson(Map<String, dynamic> json) =>
      _$CheckUserNameModelFromJson(json);
}
