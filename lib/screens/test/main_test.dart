import 'package:drawing_machine/screens/charset_menu.dart';
import 'package:drawing_machine/screens/test/test_output.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/screens/test/body.dart';

class Test extends StatefulWidget {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;

  Test(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.category});

  @override
  _TestState createState() => _TestState(
      charset: charset,
      charClass: charClass,
      stopWatch: stopWatch,
      category: category);
}

class _TestState extends State<Test> {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;
  bool willAddIndex = false;
  final indexChar = new ValueNotifier(0);
  final soundPath = new ValueNotifier('');

  double progressValue = 0.0;
  _TestState({
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
    }
  }

  @override
  void initState() {
    super.initState();
    soundPath.value = createPath(charset[indexChar.value]['romaji']);
    stopWatch.start();
  }

  String createPath(String romaji) {
    String charHolder = 'game_sound/';
    String path;

    path = charHolder + romaji + '.mp3';
    return path;
  }
}
