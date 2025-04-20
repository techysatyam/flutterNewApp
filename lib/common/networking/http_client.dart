import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

import '../../app/auth/models/login/login_response_model.dart';
import '../navigation_service/navigation_service.dart';
import '../utils/constants/constants.dart';
import '../utils/hive/hive_service.dart';
import 'network_exception.dart';

class HttpClient {
  static HttpClient? _instance;
  final _connectivity = Connectivity();

  HttpClient._();

  factory HttpClient.instance() {
    if (_instance == null) {
      return HttpClient._();
    } else {
      return _instance!;
    }
  }

  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? parameters,
    bool responseIsString = false,
    bool removeCheckAfterResponse = false,
  }) async {
    try {
      await _checkInternet();
      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');

      Uri uri = Uri.parse('$url$param');
      var response = await http.get(uri, headers: _makeHeader());
      log('$url response(${response.statusCode}: ${response.body}');
      // Parse the response JSON
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        log('===================================================');
        if (!responseIsString && !removeCheckAfterResponse) {
          _checkAfterResponse(jsonResponse);
        }
        return jsonResponse;
      }
      // Handle non-200 cases properly by returning the status code & message
      return {
        'status': response.statusCode,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'], // Include 'data' field if needed
      };
    } on NetworkException catch (e) {
      log('Network exception(${e.code}): ${e.message}');
      log('===================================================');
      rethrow;
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
  }

  Future<List<dynamic>> getList(
      {required String url, Map<String, dynamic>? parameters}) async {
    try {
      await _checkInternet();
      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        log('response(${response.statusCode}: ${response.body}');
        log('===================================================');
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
      throw NetworkException(
          message: 'Something went wrong', code: response.statusCode);
    } on NetworkException catch (e) {
      log('Network exception(${e.code}): ${e.message}');
      log('===================================================');
      rethrow;
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    bool responseIsString = false,
    bool removeCheckAfterResponse = false,
  }) async {
    try {
      await _checkInternet();
      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');
      log('body: ${jsonEncode(body)}');
      Uri uri = Uri.parse('$url$param');
      var response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: _makeHeader(),
      );
      log('$url response(${response.statusCode}: ${response.body}');
      // Parse the response JSON
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        log('===================================================');
        if (!responseIsString && !removeCheckAfterResponse) {
          _checkAfterResponse(jsonResponse);
        }
        return jsonResponse;
      }
      // Handle non-200 cases properly by returning the status code & message
      return {
        'status': response.statusCode,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'], // Include 'data' field if needed
      };
    } on FormatException catch (e) {
      log('Invalid JSON format: ${e.message}');
      rethrow;
    } on NetworkException catch (e) {
      log('Network exception(${e.code}): ${e.message}');
      log('===================================================');
      _checkAfterResponse({'status': e.code});
      rethrow;
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error (${e.runtimeType}: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
  }

  Future<List<dynamic>> postListDynamic({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    bool responseIsListDynamic = false,
    bool removeCheckAfterResponse = false,
  }) async {
    try {
      await _checkInternet();
      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');
      log('body: ${jsonEncode(body)}');
      Uri uri = Uri.parse('$url$param');
      var response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: _makeHeader(),
      );

      if (response.statusCode == 200) {
        log('$url response(${response.statusCode}: ${response.body}');
        log('===================================================');

        late List<dynamic> jsonResponse;
        // if (responseIsListDynamic) {
        jsonResponse = jsonDecode(response.body);
        // } else {
        //   jsonResponse = json.decode(response.body);
        //   if (!removeCheckAfterResponse) {
        //     // _checkAfterResponse(jsonResponse);
        //   }
        // }

        return jsonResponse;
      }
      throw NetworkException(
          message: 'Something went wrong', code: response.statusCode);
    } on NetworkException catch (e) {
      log('Network exception(${e.code}): ${e.message}');
      log('===================================================');
      _checkAfterResponse({'status': e.code});
      rethrow;
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error (${e.runtimeType}: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postMultipart({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    File? file,
    String? fileKey,
  }) async {
    try {
      await _checkInternet();
      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');
      log('body: ${jsonEncode(body)}');
      Uri uri = Uri.parse('$url$param');

      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(_makeHeader());

      Map<String, String> req = {};
      if (body != null) {
        for (var i in body.keys) {
          req[i] = body[i].toString();
        }
      }
      request.fields.addAll(req);

      if (file != null) {
        request.files
            .add(await http.MultipartFile.fromPath(fileKey ?? '', file.path));
      }

      var response = await request.send();
      var responded = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        log('response(${response.statusCode}: ${responded.body}');
        log('===================================================');

        Map<String, dynamic> jsonResponse = json.decode(responded.body);
        _checkAfterResponse(jsonResponse);

        return jsonResponse;
      }
      throw NetworkException(
          message: 'Something went wrong', code: response.statusCode);
    } on NetworkException catch (e) {
      log('Network exception(${e.code}): ${e.message}');
      log('===================================================');
      _checkAfterResponse({'status': e.code});
      rethrow;
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error (${e.runtimeType}: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
  }

  Future<File?> downloadFile({required String url}) async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;

    try {
      await _checkInternet();
      log('===================================================');
      // var status = await permission.Permission.storage.status;
      var status = android.version.sdkInt < 33
          ? await permission.Permission.storage.request()
          : permission.PermissionStatus.granted;

      if (status.isDenied) {
        await permission.Permission.storage.request();
        if (status.isDenied) {
          return Future.error('Storage permissions are denied');
        }
      }
      if (status.isPermanentlyDenied) {
        showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Storage Permission',
                  style: TextStyle(color: Colors.black)),
              content: const Text(
                  'Storage permissions are permanently denied, please enable them in the app settings.',
                  style: TextStyle(color: Colors.black)),
              actions: <Widget>[
                TextButton(
                  child: const Text('Open Settings'),
                  onPressed: () {
                    permission.openAppSettings();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return Future.error(
            'Storage permissions are permanently denied, please enable them in the app settings.');
      }
      /*if (!status.isGranted ||
          !status.isLimited ||
          status.isDenied ||
          status.isRestricted ||
          status.isPermanentlyDenied) {
        await permission.Permission.storage.request();
        AppSettings.openAppSettings(type: AppSettingsType.settings);
      }*/
      status = android.version.sdkInt < 33
          ? await permission.Permission.storage.request()
          : permission.PermissionStatus.granted;
      log('permission Status: ${status.isGranted /*|| status.isLimited*/}');
      if (status.isGranted || status.isLimited) {
        log('Download Url: $url');
        final client = http.Client();
        final request = http.Request('GET', Uri.parse(url));
        http.StreamedResponse response = await client.send(request);
        Directory? directory;

        if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = Directory('/storage/emulated/0/Download');
          // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
          // ignore: avoid_slow_async_io
          if (!await directory.exists()) {
            directory = await getExternalStorageDirectory();
          }
        }

        // before without timestamp -------------------------------------------------->>>>>
        // File file = File('${directory!.path}/${url.split('/').last}');
        // log('file path: ${file.path}');
        // await response.stream.pipe(file.openWrite());

        // after download with timestamp--------------------------------------------------->>>>>>>
        String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
        String fileNameWithExtension = url.split('/').last;
        String fileName = fileNameWithExtension.split('.').first;
        String extension = fileNameWithExtension.contains('.')
            ? '.${fileNameWithExtension.split('.').last}'
            : '';

        // Create a file path with the filename, timestamp, and extension
        String filePath = '${directory!.path}/$fileName-$timestamp$extension';

        File file = File(filePath);
        log('file path: ${file.path}');
        await response.stream.pipe(file.openWrite());
        return file;
      }

      // throw PermissionException(message: "Don't have permission to download");
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } on PermissionException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error (${e.runtimeType}: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
    return null;
  }

  Map<String, String> _makeHeader() {
    Map<String, String> header;
    // final context = NavigationService.navigatorKey.currentContext;
    LoginResponseModel? model = HiveService.read(kLoginResponseKey);
    if (model != null && model.token != null && model.token!.isNotEmpty) {
      header = {
        'Content-Type': 'application/json',
        'token': model.token ?? "",
      };
    } else {
      header = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
    }
    log('header =======>> : $header');
    return header;
  }

  String _makeParameter(Map<String, dynamic>? param) {
    if (param == null) {
      return '';
    } else {
      String strParam = '';
      for (String key in param.keys) {
        if (strParam.isEmpty) {
          strParam = '?$key=${param[key]}';
        } else {
          strParam = '&$key=${param[key]}';
        }
      }
      return strParam;
    }
  }

  String _makeParameter2(Map<String, dynamic>? param) {
    if (param == null) {
      return '';
    } else {
      String strParam = '';
      List<String> keys = param.keys.toList();

      // If 'q' exists in parameters, move it to the front
      if (keys.contains('q') && param['q']?.toString().isNotEmpty == true) {
        keys.remove('q');
        keys.insert(0, 'q');
      }

      for (String key in keys) {
        if (strParam.isEmpty) {
          strParam = '?$key=${param[key]}';
        } else {
          strParam = '$strParam&$key=${param[key]}';
        }
      }
      return strParam;
    }
  }

  String getParams({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) {
    final baseUrl = 'http://216.48.182.63';
    final queryString = _makeParameter2(queryParams);
    return '$baseUrl$endpoint/$queryString';
  }

  void _checkAfterResponse(Map<String, dynamic> response) {
    log('_checkAfterResponse ${response['status']}');

    BuildContext? context = NavigationService.navigatorKey.currentContext;

    if (context != null) {
      if (response['status'] == 401 || response['status'] == 103) {
        // CustomDialogs.defaultDialog(
        //   context: context,
        //   title: 'Attention',
        //   content: 'Sign in again please',
        //   confirmText: 'ok',
        //   onConfirm: () {
        //     HiveService.clear();
        //     if (context.mounted) {
        //       // context
        //       //     .read<AppBloc>()
        //       //     .add(const AppEvent.updateLoginResponse(null));
        //       // Navigator.pushNamedAndRemoveUntil(
        //       //   context,
        //       //   LoginScreen.route,
        //       //       (route) => false,
        //       // );
        //     }
        //   },
        // );
      }
    }
  }

  Future<void> _checkInternet() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    const String message = 'Internet is not working';
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (kIsWeb) {
        // try {
        //   var result = await http.get(Uri.parse('www.google.com'));
        //   if (result.statusCode != 200) {
        //     throw InternetException(message: message);
        //   }
        // } catch (e) {
        //   throw InternetException(message: message);
        // }
      } else {
        try {
          final result = await InternetAddress.lookup('www.google.com');
          if (result.isEmpty && result[0].rawAddress.isEmpty) {
            throw InternetException(message: message);
          }
        } on SocketException catch (_) {
          throw InternetException(message: message);
        }
      }
    } else {
      throw InternetException(message: message);
    }
  }
}
