import 'dart:async';

import 'package:audioplayer/audioplayer.dart';

enum PlayerState {
  playing,
  paused,
  stopped
}

class Audio {
  String url;
  PlayerState playerState = PlayerState.stopped;
  final AudioPlayer player = new AudioPlayer();

  Audio(this.url);

  Future<PlayerState> play() async {
    final int result = await player.play(url);
    if (result == 1) {
      playerState = PlayerState.playing;
    }
    return playerState;
  }

  Future<PlayerState> pause() async {
    final int result = await player.pause();
    if (result == 1) {
      playerState = PlayerState.paused;
    }
    return playerState;
  }

  Future<PlayerState> stop() async {
    final int result = await player.stop();
    if (result == 1) {
      playerState = PlayerState.stopped;
    }
    return playerState;
  }
}