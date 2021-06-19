import 'package:drawing_machine/screens/test/char_single.dart';
import 'package:drawing_machine/screens/test/test_output.dart';
import 'package:drawing_machine/screens/test/body_choice.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;
  final Function addProgress;

  Body(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.category,
      @required this.addProgress});
  @override
  _BodyState createState() => _BodyState(
      charset: charset,
      charClass: charClass,
      stopWatch: stopWatch,
      category: category,
      addProgress: addProgress);
}

class _BodyState extends State<Body> {
  final _points = List<Offset>();
  int _currCharDraw = 0;

  bool _isPreviewingChar = false;
  int _currCharStroke = 1;
  List<Color> colors = [];
  List questionItems = [];
  final List charset;
  final String charClass;

  final Stopwatch stopWatch;
  final String category;

  final soundPath = new ValueNotifier('');

  final Function addProgress;

  bool _isCharStateFinish = false;
  bool _showResult = false;
  bool _drawingResult = false;

  int _selectedChar = 0;
  ValueNotifier isDone = ValueNotifier(false);

  _BodyState(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.addProgress,
      @required this.category});

  @override
  void initState() {
    super.initState();

    int length = charset.length;
    for (var i = 0; i < length; i++) {
      colors.add(Colors.white);
    }
    for (var i = 0; i < length; i++) {
      questionItems.add({'kind': true, 'char': i});
    }
    for (var i = 0; i < length; i++) {
      questionItems.add({'kind': false, 'char': i});
    }
    questionItems.shuffle();
    soundPath.value =
        createPath(charset[questionItems[_currCharDraw]['char']]['romaji']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _isCharStateFinish ? nextCharState : null,
      child: Container(
        child: Center(
            child: (questionItems[_currCharDraw]['kind'])
                ? BodyChoice(
                    charset,
                    charClass,
                    (_isCharStateFinish) ? 'Tap to advance' : '',
                    questionItems[_currCharDraw]['char'],
                    colors,
                    setColor,
                    isDone,
                    soundPath)
                : CharSingle(
                    charClass: charClass,
                    charset: charset,
                    clear: clear,
                    currCharIndex: questionItems[_currCharDraw]['char'],
                    isPreviewingChar: isPreviewingChar,
                    points: _points,
                    previewChar: previewChar,
                    nextChar: _nextChar,
                    soundPath: soundPath,
                    addProgress: addProgress,
                    setCharState: setCharState,
                    nextStroke: nextStroke,
                    getCurrStroke: getCurrStroke,
                    getShowResult: getShowResult,
                    setDrawingResult: setDrawingResult,
                    getDrawingResult: getDrawingResult,
                    instructionLbl:
                        (_isCharStateFinish) ? 'Tap to advance' : '',
                    getRomaji: getRomaji,
                    getStrokes: getStrokes,
                    isDone: isDone,
                  )),
      ),
    );
  }

  //For Multiple choice page
  setColor(int index, Color color) {
    setState(() {
      colors[index] = color;
      _isCharStateFinish = true;
      _selectedChar = index;
    });
  }

  //For drawing page
  void clear() {
    setState(() {
      _currCharStroke = 1;
      _points.clear();
    });
  }

  void _nextChar() {
    _currCharDraw++;
    colors[_selectedChar] = Colors.white;
    if (_currCharDraw < charset.length * 2) {
      soundPath.value =
          createPath(charset[questionItems[_currCharDraw]['char']]['romaji']);
    }
    if (_currCharDraw >= charset.length * 2) {
      String bestTime =
          (stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
              ':' +
              (stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TestOutput(
                  category,
                  bestTime,
                  charset,
                  charClass,
                  stopWatch,
                )),
      );
    } else {
      clear();
      setState(() {
        _showResult = false;
        _currCharStroke = 1;
        addProgress();
      });
    }
  }

  String createPath(String romaji) {
    String charHolder = 'game_sound/';
    String path;

    path = charHolder + romaji + '.mp3';
    return path;
  }

  setCharState(bool state) {
    setState(() {
      if (!isPreviewingChar())
        _isCharStateFinish = state;
      else {
        _isPreviewingChar = false;
        clear();
      }
    });
  }

  nextCharState() {
    if (!isPreviewingChar()) {
      _nextChar();
      if (_currCharDraw < charset.length * 2) {
        setState(() {
          _currCharStroke = 1;
          _isCharStateFinish = false;
          isDone.value = false;
        });
      }
    } else {
      _isPreviewingChar = false;
    }
  }

  isPreviewingChar() {
    return _isPreviewingChar;
  }

  void nextStroke() {
    if (isPreviewingChar()) _points.clear();
    setState(() {
      _currCharStroke++;
    });
  }

  int getCurrStroke() {
    return _currCharStroke;
  }

  bool getShowResult() {
    return _showResult;
  }

  void setDrawingResult(bool result) {
    setState(() {
      _currCharStroke = 1;

      _showResult = true;
      _drawingResult = result;
    });
  }

  bool getDrawingResult() {
    return _drawingResult;
  }

  String getRomaji() {
    return charset[questionItems[_currCharDraw]['char']]['romaji'];
  }

  int getStrokes() {
    return charset[questionItems[_currCharDraw]['char']]['strokes'];
  }

  void previewChar() {
    if (!_isPreviewingChar && !_isCharStateFinish) {
      setState(() {
        _points.clear();
        _showResult = false;
        _isPreviewingChar = true;
        _currCharStroke = 1;
      });
    }
  }
}
