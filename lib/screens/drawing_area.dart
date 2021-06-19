import 'package:drawing_machine/screens/drawing_pad.dart';
import 'package:drawing_machine/screens/drawing_pad_border.dart';
import 'package:drawing_machine/screens/practice/charAnim.dart';
import 'package:flutter/material.dart';

class DrawingArea extends StatefulWidget {
  final List<Offset> points;

  final String currentRomaji;

  final Function nextChar;

  final Function getStrokes;

  final Function previewChar;

  final String charClass;

  final Function getRomaji;

  final Function nextStroke;

  final Function getCurrStroke;

  final Function isPreviewingChar;

  final Function setCharState;

  final Function getShowResult;

  final Function getDrawingResult;

  final Function setDrawingResult;

  DrawingArea(
      {@required this.points,
      @required this.currentRomaji,
      @required this.getStrokes,
      @required this.nextChar,
      @required this.previewChar,
      @required this.charClass,
      @required this.getRomaji,
      @required this.nextStroke,
      @required this.getCurrStroke,
      @required this.isPreviewingChar,
      @required this.setCharState,
      @required this.getShowResult,
      @required this.setDrawingResult,
      @required this.getDrawingResult});

  @override
  _DrawingAreaState createState() => _DrawingAreaState(
      points: points,
      currentRomaji: currentRomaji,
      getStrokes: getStrokes,
      nextChar: nextChar,
      previewChar: previewChar,
      charClass: charClass,
      getRomaji: getRomaji,
      nextStroke: nextStroke,
      getCurrStroke: getCurrStroke,
      isPreviewingChar: isPreviewingChar,
      setCharState: setCharState,
      getShowResult: getShowResult,
      setDrawingResult: setDrawingResult,
      getDrawingResult: getDrawingResult);
}

class _DrawingAreaState extends State<DrawingArea> {
  final List<Offset> points;

  final String currentRomaji;

  final Function nextChar;

  final Function getStrokes;

  final Function previewChar;

  final String charClass;
  final Function getRomaji;

  final Function nextStroke;

  final Function getCurrStroke;

  final Function isPreviewingChar;

  final Function setCharState;

  final Function getShowResult;

  final Function setDrawingResult;

  final Function getDrawingResult;

  _DrawingAreaState(
      {@required this.points,
      @required this.currentRomaji,
      @required this.getStrokes,
      @required this.nextChar,
      @required this.previewChar,
      @required this.charClass,
      @required this.getRomaji,
      @required this.nextStroke,
      @required this.getCurrStroke,
      @required this.isPreviewingChar,
      @required this.setCharState,
      @required this.getShowResult,
      @required this.setDrawingResult,
      @required this.getDrawingResult});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Center(child: DrawingBorder(getShowResult, getDrawingResult)),
          (isPreviewingChar())
              ? Center(
                  child: PreviewChar(
                      'assets/Flare/$charClass/' + getRomaji() + '.flr',
                      previewChar,
                      getCurrStroke))
              : Container(),
          Center(
            child: DrawingPad(
              charClass: charClass,
              points: points,
              getRomaji: getRomaji,
              getStrokes: getStrokes,
              nextChar: nextChar,
              nextStroke: nextStroke,
              getCurrStroke: getCurrStroke,
              isPreviewingChar: isPreviewingChar,
              setCharState: setCharState,
              setDrawingResult: setDrawingResult,
            ),
          ),
        ],
      ),
    );
  }
}
