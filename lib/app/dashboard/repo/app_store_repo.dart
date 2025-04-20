import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:newwhhrrr/app/dashboard/models/get_all_app_model.dart';
import 'package:newwhhrrr/common/networking/http_client.dart';

import '../../../common/encryption/encrypt.dart';
import '../../../common/networking/api_url.dart';
import '../../../common/networking/network_exception.dart';

class AppStoreRepo {
  Future<Map<String, dynamic>> addForm({
    String? appName,
    String? appDescription,
    String? appVersion,
    String? packageName,
    String? category,
    String? developerName,
    String? releaseNotes,
    String? privacyPolicyUrl,
    String? websiteUrl,
    String? docFilePath,
    String? apkFileExt,
    String? appIconExt,
    String? screenshot1Ext,
    String? screenshot2Ext,
    String? screenshot3Ext,
    String? screenshot4Ext,
    String? screenshot5Ext,
    String? apkFileBase64,
    String? appIconBase64,
    String? screenshot1Base64,
    String? screenshot2Base64,
    String? screenshot3Base64,
    String? screenshot4Base64,
    String? screenshot5Base64,
  }) async {
    try {
      final requestPayload = {
        "app_name": appName,
        "app_description": appDescription,
        "app_version": appVersion,
        "package_name": packageName,
        "category": category,
        "developer_name": developerName,
        "release_notes": releaseNotes,
        "privacy_policy_url": privacyPolicyUrl,
        "website_url": websiteUrl,
      };
      final files = {
        "apk_file": (apkFileExt, apkFileBase64),
        "app_icon": (appIconExt, appIconBase64),
        "screenshot1": (screenshot1Ext, screenshot1Base64),
        "screenshot2": (screenshot2Ext, screenshot2Base64),
        "screenshot3": (screenshot3Ext, screenshot3Base64),
        "screenshot4": (screenshot4Ext, screenshot4Base64),
        "screenshot5": (screenshot5Ext, screenshot5Base64),
      };
      Encryption encryption = Encryption();
      String encryptedRequest =
          await encryption.gcmEncryption(jsonEncode(requestPayload));
      log('print encryptedRequest: $encryptedRequest');
      log('print request: $requestPayload');
      // log('print files: $files');
      var response = await HttpClient.instance().post(
          url: ApiUrl.saveApp,
          body: {"data": encryptedRequest, "files": files});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetAllAppModel> getForm({
    required int page,
    required String search,
  }) async {
    try {
      // Fetch the encrypted response from the HTTP request
      final response = await HttpClient.instance().get(
        url: HttpClient.instance().getParams(
          endpoint: '/get-apps',
          queryParams: {
            'page': page,
            if (search.isNotEmpty) 'q': search,
          },
        ),
      );
      // Assuming the response contains the encrypted data in 'response' key
      String encryptedResponse = response['response'] ?? '';
      // Decrypt the encrypted response
      String decryptedResponse = await Encryption().gcmDecryption(
        encryptedResponse,
        Encryption().gcmKey,
      );
      // Optionally log the decrypted response for debugging purposes
      if (kDebugMode) {
        log("Decrypted Response: $decryptedResponse");
      }
      // Parse the decrypted response into a model object (e.g., GetAllAppModel)
      final Map<String, dynamic> responseMap = jsonDecode(decryptedResponse);
      // Check if status is not 200 and throw an error
      if (responseMap['status'] != 200) {
        throw NetworkException(
          code: responseMap['status'],
          message: responseMap['message'] ?? 'Something went wrong',
        );
      }
      // Convert the decrypted JSON response to the appropriate model
      GetAllAppModel model = GetAllAppModel.fromJson(responseMap);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}