import 'package:flutter/material.dart';
import 'package:drawing_machine/screens/audio_control/autoplay.dart';

class PlayAudio extends StatefulWidget{
  final ValueNotifier soundPath;

  PlayAudio(this.soundPath);
  @override
  _PlayAudioState createState() => _PlayAudioState(soundPath);
}

class _PlayAudioState extends State<PlayAudio>{
  ValueNotifier soundPath;

  _PlayAudioState(this.soundPath);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: IconButton(
          iconSize: 45.0,
          icon: Icon(Icons.volume_up),
          onPressed: () async {
            playAudio(soundPath);
          },
        ),
      ),
    );
  }
}