import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/loader.dart';
import 'package:carbonara_weather_test/presentation/widgets/error_screen/error_with_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsBackgroundMain,
      body: Observer(builder: (context) {
        if (mainState.isLoading) {
          return const Loader();
        }
        return ErrorWithRetry();
      }),
    );
  }
}
