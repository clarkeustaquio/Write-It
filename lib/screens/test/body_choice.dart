import 'package:drawing_machine/screens/audio_control/autoplay.dart';
import 'package:flutter/material.dart';
import 'package:drawing_machine/screens/test_character.dart';

class BodyChoice extends StatelessWidget {
  final List charset;
  final String charClass;
  final String instructionLbl;
  final int indexChar;
  final List<Color> colors;
  final Function setColor;

  var isDone;

  var soundPath;

  BodyChoice(this.charset, this.charClass, this.instructionLbl, this.indexChar,
      this.colors, this.setColor, this.isDone, this.soundPath);

  @override
  Widget build(BuildContext context) {
    if (!isDone.value) {
      playAudio(soundPath);
      isDone.value = true;
    }
    return Column(
      children: [
        CharacterTest(charset[indexChar]['romaji']),
        Text(
          charClass,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        Container(
          height: 40,
        ),
        for (var i = 0; i < charset.length; i++)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: RaisedButton(
              child: Text(
                charset[i]['label'],
                style: TextStyle(fontSize: 38),
              ),
              color: colors[i],
              onPressed: () {
                if (charset[i]['label'] == charset[indexChar]['label']) {
                  setColor(i, Colors.green);
                } else {
                  setColor(i, Colors.red);
                }
              },
            ),
          ),
        Container(),
        Spacer(),
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              instructionLbl,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
