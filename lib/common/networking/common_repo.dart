import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:newwhhrrr/common/networking/http_client.dart';

import '../encryption/encrypt.dart';
import 'network_exception.dart';

class CommonRepo {
  static Future<T> getData<T>(
      {required Map<String, dynamic> request,
        required T Function(Map<String, dynamic>?) jsonToResponse,
        required String url,
        String? docFile}) async {
    try {
      Encryption encryption = Encryption();
      String encryptedRequest = await encryption.gcmEncryption(jsonEncode(request));
      log('URL: $url');
      log('${request['tag']} decrypted request: $request');
      Map<String, dynamic> body;
      if (docFile == null) {
        body = {
          "request": encryptedRequest,
        };
      } else {
        body = {
          "request": encryptedRequest,
          "file": docFile ?? ''
        };
      }
      log('${request['tag']} encrypted request: $body');
      final Map<String, dynamic> encryptedResponse =
      await HttpClient.instance().post(
        url: url,
        body: body,
      );
      log('encrypted Response:== $encryptedResponse');
      if (encryptedResponse['status'] != 200) {
        if (kDebugMode) {
          print(
              'RepoException: \n Message: ${encryptedResponse['message']}');
          print(
              'RepoException: \n Error: ${encryptedResponse['error']}');
        }
        throw RepoException(
            message: encryptedResponse['message'],
            status: encryptedResponse['status']);
      }
      String decryptedResponse = await encryption.gcmDecryption(encryptedResponse['response'] ?? '', Encryption().gcmKey);
      if (kDebugMode) {
        log('${request['tag']} encrypted Response: $encryptedResponse');
        log("${request['tag']} decrypted Response ----> $decryptedResponse");
      }
      if (encryptedResponse['status'] != 200) {
        throw NetworkException(
          code: encryptedResponse['status'],
          message: jsonDecode(decryptedResponse)['message'] ??
              '${request['tag']} Something1 went wrong',
        );
      }
      return jsonToResponse(jsonDecode(decryptedResponse));
    } catch (e) {
      rethrow;
    }
  }
}