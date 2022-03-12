import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:carbonara_weather_test/presentation/screens/error_screen.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/loader.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/horizontal_orientation.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/portrait_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenState = injector<ScreenState>();
  final mainState = injector<MainState>();

  @override
  void initState() {
    mainState.initUserData();
    mainState.fetchDataByCurrentCity();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// Automatic transition to the authorization screen.
    reaction<bool?>(
      (_) => mainState.dataFetchingError,
      (error) async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ErrorScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenState.setScreenSize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorsBackgroundMain,
        body: Observer(builder: (context) {
          if (mainState.isLoading) {
            return const Loader();
          }
          return RefreshIndicator(
            onRefresh: () async {
              await mainState.fetchDataByCurrentCity();
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: OrientationBuilder(builder: (_, orientation) {
                    if (orientation.index == 1) {
                      return HorizontalOrientation();
                    } else {
                      return PortraitOrientation();
                    }
                  }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
