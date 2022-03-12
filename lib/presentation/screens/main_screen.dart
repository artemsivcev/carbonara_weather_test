import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/colours.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:carbonara_weather_test/presentation/screens/error_screen.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/loader.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/current_day.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/list_of_days.dart';
import 'package:carbonara_weather_test/presentation/widgets/main_screen/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    mainState.fetchDataByCurrentCity().onError(
          (error, stackTrace) {
            mainState.isLoading = false;
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ErrorScreen()));
          }
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenState.setScreenSize(context);
    return Scaffold(
      backgroundColor: colorsBackgroundMain,
      body: Observer(
        builder: (context) {
          if(mainState.isLoading){
            return const Loader();
          }
          return RefreshIndicator(
            onRefresh: () async {
              await mainState.fetchDataByCurrentCity().onError(
                    (error, stackTrace) {
              mainState.isLoading = false;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ErrorScreen()),
              );
            });
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: ListView(
              children: const [
                SearchBar(),
                CurrentDay(),
                ListOfDays(),
              ],
            ),
          );
        }
      ),
    );
  }
}
