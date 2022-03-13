import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'screen_state.g.dart';

class ScreenState = _ScreenState with _$ScreenState;

/// State is used for detecting screen dimensions (width and height)
abstract class _ScreenState with Store {
  /// Function help's to understand current user
  /// screen orientation by screen aspect ratio
  /// We need it to web mostly
  bool isPortrait(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return height > width;
  }

  /// Screen width info
  @observable
  double screenWidth = 0;

  /// Screen height info
  @observable
  double screenHeight = 0;

  /// Function to set screenHeight and screenWidth with new information,
  /// if screen resized
  @action
  void setScreenSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
