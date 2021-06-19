import 'package:drawing_machine/screens/drawing_painter.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/services/recognizer.dart';
import 'package:drawing_machine/utils/constants.dart';

class DrawingPad extends StatefulWidget {
  final String charClass;

  final points;
  final Function getStrokes;
  final Function nextChar;
  final Function getRomaji;

  final Function nextStroke;

  final Function getCurrStroke;

  final Function isPreviewingChar;

  final Function setCharState;

  final Function setDrawingResult;

  DrawingPad(
      {@required this.points,
      @required this.getRomaji,
      @required this.getStrokes,
      @required this.nextChar,
      @required this.nextStroke,
      @required this.getCurrStroke,
      @required this.isPreviewingChar,
      @required this.setCharState,
      @required this.setDrawingResult,
      @required this.charClass});

  @override
  _DrawingPadState createState() => _DrawingPadState(
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
      );
}

class _DrawingPadState extends State<DrawingPad> {
  final String charClass;
  final points;
  final color = Colors.white;
  final _sign = GlobalKey();
  final _recognizer = Recognizer();
  final Function nextChar;
  final Function getStrokes;
  final Function getRomaji;
  final Function getCurrStroke;
  List _output;

  final Function nextStroke;

  final Function isPreviewingChar;

  final Function setCharState;

  final Function setDrawingResult;

  _DrawingPadState({
    @required this.charClass,
    @required this.points,
    @required this.getRomaji,
    @required this.getStrokes,
    @required this.nextChar,
    @required this.nextStroke,
    @required this.getCurrStroke,
    @required this.isPreviewingChar,
    @required this.setCharState,
    @required this.setDrawingResult,
  });

  void initState() {
    super.initState();
    print('charClass: ' + charClass);
    setState(() {
      _recognizer.loadModel(charClass);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, right: 3),
        width: Constants.canvasSize - 15,
        height: Constants.canvasSize - 8,
        child: RepaintBoundary(
          key: _sign,
          child: Container(
            width: Constants.canvasSize * 0.9,
            height: Constants.canvasSize,
            decoration: BoxDecoration(
              color: (isPreviewingChar()) ? Colors.transparent : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: GestureDetector(
              onPanStart: (DragStartDetails details) {
                Offset _localPosition = details.localPosition;
                if (_localPosition.dx >= Constants.drawingBorderStart &&
                    _localPosition.dx <= 310 &&
                    _localPosition.dy >= 5 &&
                    _localPosition.dy <= 329) {
                  //29
                  addPoint(_localPosition);
                }
              },
              onPanUpdate: (DragUpdateDetails details) {
                Offset _localPosition = details.localPosition;
                if (_localPosition.dx >= Constants.drawingBorderStart &&
                    _localPosition.dx <= 310 &&
                    _localPosition.dy >= 5 &&
                    _localPosition.dy <= 329) {
                  addPoint(_localPosition);
                }
              },
              onPanEnd: (DragEndDetails details) {
                addPoint(null);
                print(getCurrStroke().toString() +
                    "  " +
                    getStrokes().toString());
                if (getCurrStroke() == getStrokes()) {
                  if (isPreviewingChar()) {
                    nextStroke();
                    setCharState(true);
                  } else {
                    _recognizer.recognize(
                        _sign.currentContext.findRenderObject(), toggleRunning);
                  }
                } else {
                  nextStroke();
                }
              },
              child: CustomPaint(
                painter: DrawingPainter(points),
              ),
            ),
          ),
        ));
  }

  void toggleRunning(List output) {
    setState(() {
      _output = output;
    });

    print(_output[0]['confidence'] * 100);

    print('Romaji: ${getRomaji()}');
    print('Output: ${_output[0]['label']}');
    print(_output[0]['label']);

    if (getRomaji() == _output[0]['label']) {
      setDrawingResult(true);
      setCharState(true);
    } else {
      print('False');
      points.clear();
      setDrawingResult(false);
    }
  }

  void addPoint(Offset p) {
    setState(() {
      points.add(p);
    });
  }

  @override
  void dispose() {
    _recognizer.close();
    super.dispose();
  }
}
