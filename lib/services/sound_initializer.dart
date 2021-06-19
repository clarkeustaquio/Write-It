import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:drawing_machine/utils/constants.dart';

final AudioCache audioCache = AudioCache();
final Constants constants = Constants();

Future<void> loadSound() async{
  List characters = constants.hiraganaChart;

  for(var character in characters){
    for(var i = 0; i < character.length; i++){
      audioCache.load('game_sound/${character[i]['character']}.mp3');
    }
  }
}