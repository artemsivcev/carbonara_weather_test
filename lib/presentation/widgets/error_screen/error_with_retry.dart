import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/presentation/widgets/common/button.dart';
import 'package:flutter/widgets.dart';

class ErrorWithRetry extends StatelessWidget {
  ErrorWithRetry({Key? key}) : super(key: key);
  final mainState = injector<MainState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something went wrong, try retry!",
            textAlign: TextAlign.center,
            style: textStyleMain40,
          ),
          const SizedBox(
            height: 16,
          ),
          Button(
            text: 'Retry',
            onButtonTap: () => {
              mainState.fetchDataByCurrentCity().then(
                    (value) => Navigator.pop(context),
                  ),
            },
          ),
        ],
      ),
    );
  }
}
