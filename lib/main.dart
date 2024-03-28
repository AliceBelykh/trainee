import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trainee/get_it.dart';
import 'package:trainee/presentation/application/application.dart';

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Application());
}
