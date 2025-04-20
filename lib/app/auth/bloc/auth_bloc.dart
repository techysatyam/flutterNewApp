import 'dart:developer';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/networking/common_repo.dart';
import '../../../common/utils/constants/constants.dart';
import '../../../common/utils/helpers/helper_functions.dart';
import '../../../common/utils/hive/hive_service.dart';
import '../../../common/utils/validators/validation.dart';
import '../../dashboard/repo/app_store_repo.dart';
import '../models/check_user_name/check_user_name_model.dart';
import '../models/login/login_response_model.dart';
import '../models/verify_otp/verify_otp_model.dart';
import '../repo/auth_repo.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  AuthBloc() : super(AuthState(authRepo: AuthRepo())) {
    on<_GenerateCaptcha>((event, emit) {
      captchaController.clear();
      String captcha = AppHelperFunctions.generateRandomString(6);
      emit(state.copyWith(
        captcha: captcha,
        status: AuthStatus.initial,
      ));
    });

    on<_RememberMe>((event, emit) {
      emit(state.copyWith(
        rememberMe: event.isRemember,
        status: AuthStatus.initial,
      ));
    });

    on<_TogglePasswordVisibility>((event, emit) {
      if (event.isConfirmPassword) {
        emit(state.copyWith(
            confirmVisibility: !state.confirmVisibility,
            status: AuthStatus.initial));
      } else {
        emit(state.copyWith(
            visibility: !state.visibility, status: AuthStatus.initial));
      }
    });

    on<_Login>((event, emit) async {
      String password = passwordController.text.trim();
      String username = usernameController.text.trim();
      String captcha = captchaController.text.trim();

      log("userFields==============>> userName :- $username , password :-  $password");
      var result = AppValidator.validateField(
          username: username,
          password: password,
          checkStrongPassword: false,
          generatedCaptcha: state.captcha,
          enteredCaptcha: captcha);

      if (!result.isValid) {
        emit(state.copyWith(
            uniqueKey: DateTime.now().millisecondsSinceEpoch,
            status: AuthStatus.toastError,
            message: result.message));
        return;
      }
      emit(state.copyWith(status: AuthStatus.loading));
      try {
       /* LoginResponseModel response = await state.authRepo.login(
          password: password, // passwordController.value.text,
          userName: username, // mobileController.value.text,
        );

        if (response.isSuccess && response.data != null) {
          if (state.rememberMe) {
            await HiveService.writeBox2(kLoginUserId, username);
            await HiveService.writeBox2(kLoginUserPassword, password);
            await HiveService.writeBox2(kRememberMe, state.rememberMe);
          } else {
            await HiveService.writeBox2(kLoginUserId, "");
            await HiveService.writeBox2(kLoginUserPassword, "");
            await HiveService.writeBox2(kRememberMe, false);
          }

          await HiveService.write(kLoginResponseKey, response.data);
          emit(
            state.copyWith(
                message: response.message ?? '',
                status: AuthStatus.success,
                loginResponseModel: response.data),
          );
        } else {
          // Emit the dynamic status and message from API
          emit(state.copyWith(
            status: AuthStatus.error,
            message: response.message ??
                "Login failed with status ${response.status}",
          ));
        }*/
      } catch (e) {
        // Handle exceptions with dynamic messages
        emit(state.copyWith(
          status: AuthStatus.error,
          message: e.toString(),
        ));
      }
    });

    on<_CheckUserName>((event, emit) async {
      String username = usernameController.text.trim();

      log("userFields==============>> userName :- $username");
      var result = AppValidator.validateField(username: username);

      if (!result.isValid) {
        emit(state.copyWith(
            uniqueKey: DateTime.now().millisecondsSinceEpoch,
            status: AuthStatus.toastError,
            message: result.message));
        return;
      }
      emit(state.copyWith(status: AuthStatus.checkUserNameLoading));
      try {
       /* ApiResponse<CheckUserNameModel> response =
            await state.authRepo.checkUserName(
          userName: username,
        );

        if (response.isSuccess && response.data != null) {
          await HiveService.write(kLoginResponseKey, response);
          emit(
            state.copyWith(
                status: AuthStatus.checkUserNameSuccess,
                checkUserModel: response.data),
          );
        } else {
          emit(state.copyWith(
            status: AuthStatus.error,
            message: response.message ??
                "Login failed with status ${response.status}",
          ));
        }*/
      } catch (e) {
        // Handle exceptions with dynamic messages
        emit(state.copyWith(
          status: AuthStatus.error,
          message: e.toString(),
        ));
      }
    });

    on<_VerifyOtp>((event, emit) async {
      String password = passwordController.text.trim();
      String username = usernameController.text.trim();
      String captcha = captchaController.text.trim();

      log("userFields==============>> userName :- $username , password :-  $password");
      var result = AppValidator.validateField(
          username: username,
          password: password,
          checkStrongPassword: true,
          generatedCaptcha: state.captcha,
          enteredCaptcha: captcha);

      if (!result.isValid) {
        emit(state.copyWith(
            uniqueKey: DateTime.now().millisecondsSinceEpoch,
            status: AuthStatus.toastError,
            message: result.message));
        return;
      }
      emit(state.copyWith(status: AuthStatus.verifyOtpLoading));
      try {
        /*ApiResponse<VerifyOtpModel> response =
            await state.authRepo.verifyOtp(otp: '', reqId: '');

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
                status: AuthStatus.verifyOtpSuccess,
                verifyOtpModel: response.data),
          );
        } else {
          // Emit the dynamic status and message from API
          emit(state.copyWith(
            status: AuthStatus.error,
            message: response.message ??
                "Login failed with status ${response.status}",
          ));
        }*/
      } catch (e) {
        // Handle exceptions with dynamic messages
        emit(state.copyWith(
          status: AuthStatus.error,
          message: e.toString(),
        ));
      }
    });

    on<_ForgotPassword>((event, emit) async {
      String password = passwordController.text.trim();
      String cnfPassword = cnfPasswordController.text.trim();

      log("userFields==============>> password :-  $password");
      var result = AppValidator.validateField(
          password: password,
          confirmPassword: cnfPassword,
          checkStrongPassword: true);

      if (!result.isValid) {
        emit(state.copyWith(
            uniqueKey: DateTime.now().millisecondsSinceEpoch,
            status: AuthStatus.toastError,
            message: result.message));
        return;
      }
      emit(state.copyWith(status: AuthStatus.createPassLoading));
      try {
       /* void response = await state.authRepo.forgotPassword(
          reqId: state.checkUserModel?.reqId ?? '',
          otp: '',
          newPass: '',
        );

        if (response.isSuccess) {
          emit(
            state.copyWith(
              status: AuthStatus.createPassSuccess,
            ),
          );
        } else {
          // Emit the dynamic status and message from API
          emit(state.copyWith(
            status: AuthStatus.error,
            message: response.message ??
                "Login failed with status ${response.status}",
          ));
        }*/
      } catch (e) {
        // Handle exceptions with dynamic messages
        emit(state.copyWith(
          status: AuthStatus.error,
          message: e.toString(),
        ));
      }
    });
  }
}
