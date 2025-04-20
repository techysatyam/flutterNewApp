import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../models/check_user_name/check_user_name_model.dart';
import '../models/login/login_response_model.dart';
import '../models/verify_otp/verify_otp_model.dart';

class AuthRepo {
  Future<LoginResponseModel> login(
    String password,
    String userName,
  ) async {
    try {
      Map<String, dynamic> request = {
        "username": userName,
        "password": password,
      };
      LoginResponseModel response =
          await CommonRepo.getData<LoginResponseModel>(
        request: request,
        url: ApiUrl.login,
        /*fromJson: (json) => LoginResponseModel.fromJson(json!),*/
        jsonToResponse: (json) => LoginResponseModel.fromJson(json!),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckUserNameModel> checkUserName({required String userName}) async {
    try {
      var response = CommonRepo.getData(
        url: ApiUrl.checkUserName,
        request: {
          "username": userName,
        },
        jsonToResponse: (json) => CheckUserNameModel.fromJson(json!),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Future<VerifyOtpModel?>> verifyOtp({
    required String reqId,
    required String otp,
  }) async {
    try {
      var response = CommonRepo.getData(
        url: ApiUrl.verifyOtp,
        request: {"reqId": reqId, "otp": otp},
        jsonToResponse: (json) => VerifyOtpModel.fromJson(json!),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword({
    required String reqId,
    required String otp,
    required String newPass,
  }) async {
    try {
      var response = CommonRepo.getData(
        url: ApiUrl.forgotPassword,
        request: {"reqId": reqId, "otp": otp, "newPassword": newPass},
        jsonToResponse: (_) => null, // if data is no any
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
