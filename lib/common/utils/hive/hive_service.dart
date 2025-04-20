import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../app/auth/models/login/login_response_model.dart';

class HiveService {
  static late Box box;
  static late Box box2;

  static bool _initialized = false;

  static Future<void> init() async {
    if (!_initialized) {
      await Hive.initFlutter();

      Hive.registerAdapter(LoginResponseModelAdapter());

      box = await Hive.openBox('box');
      box2 = await Hive.openBox('box2');

      _initialized = true;
    }
  }

  static dynamic read(dynamic key) {
    if (!_initialized) {
      throw Exception('HiveService has not been initialized.');
    }
    var data = box.get(key);
    log('$key: $data');
    return data;
  }

  static Future<void> write(dynamic key, dynamic value) async {
    if (!_initialized) {
      throw Exception('HiveService has not been initialized.');
    }
    await box.put(key, value);
  }

  static close() {
    box.close();
  }

  static clear() {
    box.clear();
  }

  // box2 for only which data you don't want to clear after logout like user id and password to remember
  static readBox2(dynamic key) {
    var data = box2.get(key);
    log('$key: $data');
    return data;
  }

  static writeBox2(dynamic key, dynamic value) async {
    await box2.put(key, value);
  }

  static closeBox2() {
    box2.close();
  }

  static clearBox2() {
    box2.clear();
  }
}
