import 'package:carbonara_weather_test/domain/constants/text_styles.dart';
import 'package:flutter/widgets.dart';

class ErrorWithText extends StatelessWidget {
  const ErrorWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Looks like this city is missing, try other!",
            textAlign: TextAlign.center,
            style: textStyleMain40,
          ),
        ],
      ),
    );
  }
}
