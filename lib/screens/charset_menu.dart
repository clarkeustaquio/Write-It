import 'package:drawing_machine/screens/test/main_test.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/screens/practice/main_practice.dart';
import 'package:drawing_machine/screens/main/main_body.dart';
import 'package:drawing_machine/screens/main/star.dart';

import 'package:drawing_machine/database/connection.dart';

class CharsetMenu extends StatefulWidget {
  final List charset;
  final String charClass;
  final String category;

  CharsetMenu(
      {@required this.charset,
      @required this.charClass,
      @required this.category});
  @override
  _CharsetMenuState createState() => _CharsetMenuState(
      charset: charset, charClass: charClass, category: category);
}

class _CharsetMenuState extends State<CharsetMenu> {
  final Connection connection = Connection();
  final List charset;
  final String charClass;
  final String category;
  final Stopwatch stopWatch = Stopwatch();

  String bestTime = '-----';
  _CharsetMenuState(
      {@required this.charset,
      @required this.charClass,
      @required this.category});

  @override
  void initState() {
    super.initState();
    if (mounted)
      setState(() {
        _getBestTime(charClass, category);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Color(0xffcd5c5c),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainBody()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 30.0),
                child: Star(70.0, charClass, category),
              ),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(top: 40.0),
            child: Text(
              'Best Time',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
              future: _getBestTime(charClass, category),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        child: Text(
                          snapshot.data,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      )
                    : CircularProgressIndicator();
              }),
          Container(
            // margin: EdgeInsets.only(top: 50.0),
            child: Text(
              'Content',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 40.0),
            child: Text(
              _content(),
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Practice(
                            charset: charset,
                            charClass: charClass,
                            stopWatch: stopWatch,
                            category: category)));
                  },
                  child: Text(
                    'Practice',
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
                    if (connection != null) {
                      await connection.closeDatabase();
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Test(
                            charset: charset,
                            charClass: charClass,
                            stopWatch: stopWatch,
                            category: category)));
                  },
                  child: Text(
                    'Test',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<String> _getBestTime(String charClass, String category) async {
    await connection.openConnection();
    if (charClass == 'hiragana') {
      var hiraganaList = await connection.getHiragana(category);

      for (var hiragana in hiraganaList) {
        if (category == hiragana.hiragana && mounted) {
          setState(() {
            bestTime = hiragana.time;
          });
        }
      }
    } else if (charClass == 'katakana') {
      var katakanaList = await connection.getKatakana(category);

      for (var katakana in katakanaList) {
        if (category == katakana.katakana && mounted) {
          setState(() {
            bestTime = katakana.time;
          });
        }
      }
    }

    return bestTime;
  }

  @protected
  @mustCallSuper
  void dispose() {
    stopWatch.stop();
    super.dispose();
  }

  String _content() {
    String str = '';
    for (var i in charset) {
      str += i['label'] + ' ';
    }
    return str;
  }
}
