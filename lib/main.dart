import 'package:al_takamul_alteqani_test/injection.dart';
import 'package:flutter/material.dart';
import 'package:al_takamul_alteqani_test/app.dart';
import 'package:al_takamul_alteqani_test/core/data/utils/app_environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(AppEnvironment.staging);
  runApp(const App());
}
