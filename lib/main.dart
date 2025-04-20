import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app/app.dart';
import 'common/utils/hive/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  await HiveService.init();

  runApp(const App());
}
