import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbonara Weather App',
      theme: ThemeData(
        primaryColor: colorsBackgroundMenu,
      ),
      home: const MainScreen(),
    );
  }
}
