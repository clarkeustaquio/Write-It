import 'package:drawing_machine/screens/charset_menu.dart';
import 'package:drawing_machine/screens/practice/practice_output.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/screens/practice/body.dart';

class Practice extends StatefulWidget {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;

  Practice(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.category});

  @override
  _PracticeState createState() => _PracticeState(
      charset: charset,
      charClass: charClass,
      stopWatch: stopWatch,
      category: category);
}

class _PracticeState extends State<Practice> {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;
  bool willAddIndex = false;
  final indexChar = new ValueNotifier(0);
  final soundPath = new ValueNotifier('');

  double progressValue = 0.0;
  _PracticeState({
    @required this.charset,
    @required this.charClass,
    @required this.stopWatch,
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              minHeight: 15.0,
              value: progressValue,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            stopWatch.reset();
            stopWatch.stop();

            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CharsetMenu(
                        charset: charset,
                        charClass: charClass,
                        category: category,
                      )),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(
        charset: charset,
        charClass: charClass,
        stopWatch: stopWatch,
        category: category,
        addProgress: addProgress,
      ),
    );
  }

  void addProgress() {
    var progressCalculate = (1 / charset.length) / 2;

    setState(() {
      progressValue += progressCalculate;
      if (willAddIndex) {
        indexChar.value += 1;
        if (indexChar.value < charset.length)
          soundPath.value = createPath(charset[indexChar.value]['romaji']);
        willAddIndex = !willAddIndex;
      }
    });

    if (indexChar.value >= charset.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PracticeOutput(
                  category: category,
                  charset: charset,
                  charClass: charClass,
                  stopWatch: stopWatch,
                )),
      );
    }
  }

  String createPath(String romaji) {
    String charHolder = 'game_sound/';
    String path;

    path = charHolder + romaji + '.mp3';
    return path;
  }
}
