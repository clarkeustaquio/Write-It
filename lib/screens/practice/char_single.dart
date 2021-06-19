import 'package:drawing_machine/screens/drawing_area.dart';
import 'package:drawing_machine/screens/practice/subtitle.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/screens/test_character.dart';
import 'package:drawing_machine/screens/audio_control/play_audio.dart';

import 'package:drawing_machine/screens/audio_control/autoplay.dart';

class CharSingle extends StatelessWidget {
  final String charClass;
  final List charset;
  final int currCharIndex;
  final Function isPreviewingChar;
  final Function clear;
  final Function previewChar;
  final List<Offset> points;
  final Function nextChar;

  final soundPath;

  final Function addProgress;

  final Function setCharState;

  final Function getCurrStroke;

  final Function nextStroke;

  final Function getShowResult;

  final Function setDrawingResult;

  final Function getDrawingResult;

  final Function getRomaji;

  final Function getStrokes;

  final String instructionLbl;
  final ValueNotifier isDone;

  CharSingle({
    @required this.charClass,
    @required this.currCharIndex,
    @required this.clear,
    @required this.previewChar,
    @required this.isPreviewingChar,
    @required this.points,
    @required this.charset,
    @required this.nextChar,
    @required this.soundPath,
    @required this.addProgress,
    @required this.setCharState,
    @required this.nextStroke,
    @required this.getCurrStroke,
    @required this.getShowResult,
    @required this.setDrawingResult,
    @required this.getDrawingResult,
    @required this.instructionLbl,
    @required this.getRomaji,
    @required this.getStrokes,
    @required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    if (!isDone.value) {
      playAudio(soundPath);
      isDone.value = true;
    }
    return Column(
      children: [
        CharacterTest(charset[currCharIndex]['romaji']),
        Text(
          charClass,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        Subtitle('Strokes: ', getStrokes, getCurrStroke, false),
        Subtitle('Current Stroke: ', getStrokes, getCurrStroke, true),
        DrawingArea(
            points: points,
            getStrokes: getStrokes,
            nextChar: nextChar,
            currentRomaji: charset[currCharIndex]['romaji'],
            previewChar: previewChar,
            charClass: charClass,
            getRomaji: getRomaji,
            nextStroke: nextStroke,
            getCurrStroke: getCurrStroke,
            isPreviewingChar: isPreviewingChar,
            setCharState: setCharState,
            getShowResult: getShowResult,
            setDrawingResult: setDrawingResult,
            getDrawingResult: getDrawingResult),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: IconButton(
                      iconSize: 45.0,
                      icon: Icon(Icons.delete),
                      onPressed: clear,
                    ),
                  ),
                ),
                PlayAudio(soundPath),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: IconButton(
                      iconSize: 45.0,
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: previewChar,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
