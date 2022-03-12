import 'dart:io';

import 'package:carbonara_weather_test/data/weather_api.dart';
import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'main_state.g.dart';

class MainState = _MainState with _$MainState;

/// State is used for manipulating with main settings of the game.
/// For example, when the user wants to go back or choosing
/// to play the game with image or not.
abstract class _MainState with Store {
  final WeatherApi weatherApi = injector<WeatherApi>();

  // @observable
  // GameState currentGameState = GameState.ENTRY;
  //
  // @observable
  // GameState? previousGameState;
  //
  // @action
  // changeCurrentGameState(GameState state) {
  //   previousGameState = currentGameState;
  //
  //   currentGameState = state;
  // }

  @action
  Future<void> getDataByCity(String city) async {
    await weatherApi.getDataByCity(city).then((cityData) async =>
    await weatherApi.getWeatherByWOEIDForToday(cityData.woeid).then((weather) => null)
    );
  }

  // /// restore all bools and go back to menu
  // @action
  // Future<void> backToMenu() async {
  //   changeCurrentGameState(GameState.MAIN_MENU);
  //   soundState.playBackwardSound();
  //   injector<ChooseImageState>().resetChooseImageStateData();
  //   injector<PuzzleState>().resetTimer();
  //   injector<PuzzleState>().resetMovementsCounter();
  //   injector<StartAnimationState>().resetStartAnimation();
  //   injector<WinAnimationState>().resetAnimation();
  //   injector<ShuffleAnimationState>().resetAnimation();
  //   _tileAnimationState.currentAnimationPhase = null;
  // }

  /// logic for play btn. It changes btn state
  /// and calls [splitImage] function
  // @action
  // Future<void> playWithImagePress() async {
  //   changeCurrentGameState(GameState.CHOOSE_IMAGE);
  //   soundState.playForwardSound();
  //   _tileAnimationState.currentAnimationPhase =
  //       TileAnimationPhase.START_ANIMATION;
  // }
  //
  // /// logic for play btn without image
  // @action
  // Future<void> playWithOutImagePress() async {
  //   soundState.playForwardSound();
  //   changeCurrentGameState(GameState.WITHOUT_IMAGE_PLAY);
  //   injector<PuzzleState>().generatePuzzle();
  //   _tileAnimationState.currentAnimationPhase =
  //       TileAnimationPhase.START_ANIMATION;
  // }

  @observable
  bool exitBtnPressed = false;

  /// press exit button (for mobile)
  @action
  void toggleExitBtn(BuildContext context) {
    exitBtnPressed = !exitBtnPressed;
    //Popping the screen to enforce the dispose() of the screen work.
    Navigator.of(context).pop();
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
  }
}

enum GameState {
  ENTRY,
  MAIN_MENU,
  CHOOSE_IMAGE,
  WITHOUT_IMAGE_PLAY,
  DEFAULT_IMAGE_PLAY,
  CUSTOM_IMAGE_PLAY,
  SHUFFLE,
  WIN,
  EXIT_GAME,
}
