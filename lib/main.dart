import 'package:flutter/material.dart';
import 'package:trainee/get_it.dart';
import 'package:trainee/presentation/application/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Application());
}
