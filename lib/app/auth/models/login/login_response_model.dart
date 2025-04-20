import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';



@freezed
@HiveType(typeId: 1)
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @HiveField(0) @JsonKey(name: "message") String? message,
    @HiveField(1) @JsonKey(name: "token") String? token,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
