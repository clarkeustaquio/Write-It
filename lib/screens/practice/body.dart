import 'package:drawing_machine/screens/practice/char_single.dart';
import 'package:drawing_machine/screens/practice/practice_output.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;
  final Function addProgress;

  Body({
    @required this.charset,
    @required this.charClass,
    @required this.stopWatch,
    @required this.category,
    @required this.addProgress,
  });
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
  int _currCharIndex = 0;
  bool _isPreviewingChar = true;
  int _currCharStroke = 1;
  int _previewCounter = 0;
  final List charset;
  final String charClass;

  final Stopwatch stopWatch;
  final String category;

  final soundPath = new ValueNotifier('');
  ValueNotifier isDone = ValueNotifier(false);
  final Function addProgress;

  bool _isCharStateFinish = false;
  bool _showResult = false;
  bool _drawingResult = false;
  final List<String> _instructionLbls = [
    'Trace the character',
    'Write the character',
    'Tap to advance'
  ];

  int _instructionLblIndex = 0;

  _BodyState(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.addProgress,
      @required this.category});

  @override
  void initState() {
    super.initState();
    soundPath.value = createPath(charset[_currCharIndex]['romaji']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _isCharStateFinish ? nextCharState : null,
      child: Container(
        child: Center(
            child: CharSingle(
          isDone: isDone,
          charClass: charClass,
          charset: charset,
          clear: clear,
          currCharIndex: _currCharIndex,
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
          instructionLbl: _instructionLbls[_instructionLblIndex],
          getRomaji: getRomaji,
          getStrokes: getStrokes,
        )),
      ),
    );
  }

  void clear() {
    setState(() {
      _currCharStroke = 1;
      _points.clear();
    });
  }

  void _nextChar() {
    _currCharIndex++;
    _previewCounter = 0;
    if (_currCharIndex < charset.length)
      soundPath.value = createPath(charset[_currCharIndex]['romaji']);

    if (_currCharIndex >= charset.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PracticeOutput(
                  charClass: charClass,
                  charset: charset,
                  stopWatch: stopWatch,
                  category: category,
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
      _isCharStateFinish = state;
    });
  }

  nextCharState() {
    if (!_isPreviewingChar)
      _nextChar();
    else {
      if (_previewCounter == 0) addProgress();
    }
    if (_currCharIndex < charset.length) {
      setState(() {
        _instructionLblIndex = (_instructionLblIndex + 1) % 3;
        _isPreviewingChar = !_isPreviewingChar;
        _currCharStroke = 1;
        _isCharStateFinish = false;
        isDone.value = false;
      });
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
      if (result) {
        _instructionLblIndex = (_instructionLblIndex + 1) % 3;
      } else {
        _currCharStroke = 1;
      }
      _showResult = true;
      _drawingResult = result;
    });
  }

  bool getDrawingResult() {
    return _drawingResult;
  }

  String getRomaji() {
    return charset[_currCharIndex]['romaji'];
  }

  int getStrokes() {
    return charset[_currCharIndex]['strokes'];
  }

  void previewChar() {
    if (!_isPreviewingChar && !_isCharStateFinish) {
      _previewCounter++;
      setState(() {
        _points.clear();
        _showResult = false;
        _isPreviewingChar = true;
        _currCharStroke = 1;
        _instructionLblIndex = 0;
      });
    }
  }
}
