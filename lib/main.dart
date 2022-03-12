import 'package:carbonara_weather_test/presentation/application.dart';
import 'package:flutter/material.dart';

import 'di/injector_provider.dart';

Future<void> main() async {
  await init();

  runApp(
    const MyApp(),
  );
}

Future<void> init() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  // Preload all assets to prevent flash when they are loaded.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) async {
    BuildContext? context = binding.renderViewElement;
    if (context != null) {
      // Run any sync or awaited async function you want to wait for before showing your UI
      // await precacheImage(
      //     const AssetImage('assets/images/avatar_artem.png'), context);
      // await precacheImage(
      //     const AssetImage('assets/images/avatar_dasha.png'), context);
      // await precacheImage(
      //     const AssetImage('assets/images/avatar_maxim.png'), context);
      // await precacheImage(
      //     const AssetImage('assets/images/avatar_chris.png'), context);
    }
    binding.allowFirstFrame();
  });
  await setupInjection();
}
