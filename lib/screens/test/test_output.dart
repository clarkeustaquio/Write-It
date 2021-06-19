import 'package:drawing_machine/screens/charset_menu.dart';
import 'package:flutter/material.dart';
import 'package:drawing_machine/screens/main/main_body.dart';
import 'package:drawing_machine/screens/star_output.dart';
import 'package:drawing_machine/screens/test/main_test.dart';

import 'package:drawing_machine/database/connection.dart';
import 'package:drawing_machine/models/hiragana.dart';
import 'package:drawing_machine/models/katakana.dart';

import 'package:drawing_machine/utils/constants.dart';

class TestOutput extends StatefulWidget {
  final String category;
  final String bestTime;

  final List charset;
  final String charClass;
  final Stopwatch stopWatch;

  TestOutput(
    this.category,
    this.bestTime,
    this.charset,
    this.charClass,
    this.stopWatch,
  );
  @override
  _TestOutputState createState() =>
      _TestOutputState(category, bestTime, charset, charClass, stopWatch);
}

class _TestOutputState extends State<TestOutput> {
  final String category;
  final String bestTime;

  final List charset;
  final String charClass;
  final Stopwatch stopWatch;

  final Connection connection = Connection();
  final Constants constants = Constants();

  int starCount;

  _TestOutputState(
    this.category,
    this.bestTime,
    this.charset,
    this.charClass,
    this.stopWatch,
  );

  String _appendComplete(String category) {
    category = '$category - Test Complete';
    return category;
  }

  @override
  void initState() {
    super.initState();
    _getStarCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcd5c5c),
        title: Text(_appendComplete(category)),
        leading: BackButton(
          onPressed: () async {
            await connection.openConnection();

            if (charClass == 'hiragana') {
              var hiraganaList = await connection.getHiragana(category);

              Hiragana hiraganaModel = Hiragana(
                hiragana: category,
                time: bestTime,
                star: starCount,
              );

              if (hiraganaList.length > 0) {
                for (var hiragana in hiraganaList) {
                  if (category == hiragana.hiragana) {
                    String databaseTime = hiragana.time;
                    Duration durationTime = _parseTime(databaseTime);

                    if (stopWatch.elapsed < durationTime) {
                      await connection.addHiragana(hiraganaModel);
                    }
                  }
                }
              } else {
                await connection.addHiragana(hiraganaModel);
              }
            } else if (charClass == 'katakana') {
              var katakanaList = await connection.getKatakana(category);

              Katakana katakanaModel = Katakana(
                katakana: category,
                time: bestTime,
                star: starCount,
              );

              if (katakanaList.length > 0) {
                for (var katakana in katakanaList) {
                  if (category == katakana.katakana) {
                    String databaseTime = katakana.time;
                    Duration durationTime = _parseTime(databaseTime);

                    if (stopWatch.elapsed < durationTime) {
                      await connection.addKatakana(katakanaModel);
                    }
                  }
                }
              } else {
                await connection.addKatakana(katakanaModel);
              }
            }

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => CharsetMenu(
                        charClass: charClass,
                        charset: charset,
                        category: category,
                      )),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: StarOutput(70.0, starCount),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Text(
              'Time',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Text(
              bestTime,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 150.0,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  stopWatch.reset();
                  stopWatch.stop();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Test(
                              charset: charset,
                              charClass: charClass,
                              stopWatch: stopWatch,
                              category: category,
                            )),
                  );
                },
                child: Text(
                  'Retry',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: RaisedButton(
                onPressed: () async {
                  await connection.openConnection();

                  if (charClass == 'hiragana') {
                    var hiraganaList = await connection.getHiragana(category);

                    Hiragana hiraganaModel = Hiragana(
                      hiragana: category,
                      time: bestTime,
                      star: starCount,
                    );

                    if (hiraganaList.length > 0) {
                      for (var hiragana in hiraganaList) {
                        if (category == hiragana.hiragana) {
                          String databaseTime = hiragana.time;
                          Duration durationTime = _parseTime(databaseTime);

                          if (stopWatch.elapsed < durationTime) {
                            await connection.addHiragana(hiraganaModel);
                          }
                        }
                      }
                    } else {
                      await connection.addHiragana(hiraganaModel);
                    }
                  } else if (charClass == 'katakana') {
                    var katakanaList = await connection.getKatakana(category);

                    Katakana katakanaModel = Katakana(
                      katakana: category,
                      time: bestTime,
                      star: starCount,
                    );

                    if (katakanaList.length > 0) {
                      for (var katakana in katakanaList) {
                        if (category == katakana.katakana) {
                          String databaseTime = katakana.time;
                          Duration durationTime = _parseTime(databaseTime);

                          if (stopWatch.elapsed < durationTime) {
                            await connection.addKatakana(katakanaModel);
                          }
                        }
                      }
                    } else {
                      await connection.addKatakana(katakanaModel);
                    }
                  }

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => CharsetMenu(
                              charClass: charClass,
                              charset: charset,
                              category: category,
                            )),
                  );
                },
                child: Text(
                  'Complete',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getStarCount() {
    setState(() {
      if (stopWatch.elapsed < constants.star_3) {
        starCount = 3;
      } else if (stopWatch.elapsed < constants.star_2) {
        starCount = 2;
      } else {
        starCount = 1;
      }
    });
  }

  Duration _parseTime(String databaseTime) {
    List<String> timeSplit = databaseTime.split(':');
    int minutes = int.parse(timeSplit[0]);
    int seconds = int.parse(timeSplit[1]);

    Duration durationTime = Duration(minutes: minutes, seconds: seconds);
    return durationTime;
  }
}
