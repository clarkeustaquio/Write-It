import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';


Future<void> playAudio(ValueNotifier soundPath) async{
  AudioCache audioCache = AudioCache();
  AudioPlayer.logEnabled = false;

  await audioCache.play(soundPath.value, mode: PlayerMode.LOW_LATENCY)
    .then((value) async {
      audioCache.clear(soundPath.value);
  });
   await audioCache.load(soundPath.value);
}