import 'dart:async';

import 'package:audioplayer/audioplayer.dart';

enum PlayerState {
  playing,
  paused,
  stopped
}

class Player {
  static String url;
  static PlayerState playerState = PlayerState.stopped;
  static final AudioPlayer player = new AudioPlayer();

  static Future<PlayerState> play(String url) async {
    final int result = await player.play(url);
    if (result == 1) {
      playerState = PlayerState.playing;
    }
    return playerState;
  }

  static Future<PlayerState> pause() async {
    final int result = await player.pause();
    if (result == 1) {
      playerState = PlayerState.paused;
    }
    return playerState;
  }

  static Future<PlayerState> stop() async {
    final int result = await player.stop();
    if (result == 1) {
      playerState = PlayerState.stopped;
    }
    return playerState;
  }
}