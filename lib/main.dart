import 'package:carbonara_weather_test/presentation/application.dart';
import 'package:flutter/material.dart';

import 'di/injector_provider.dart';

Future<void> main() async {
  await init();

  runApp(
    const MyApp(),
  );
}

/// Function with some async init libs
Future<void> init() async {
  await setupInjection();
}
