import 'package:flutter/material.dart';
import 'package:drawing_machine/utils/constants.dart';
import 'package:drawing_machine/database/connection.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final Constants constants = Constants();
  final Connection connection = Connection();

  int totalLesson;
  int totalStar;
  List hiraganaList;
  List katakanaList;

  int lessonCompleted = 0;
  int starCompleted = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      totalLesson =
          constants.hiraganaCharsets.length + constants.katakanaCharsets.length;
      totalStar = totalLesson * 3;

      // _getData();
    });
  }

  // void _getData() async{
  //   await connection.openConnection();
  //   hiraganaList = await connection.getAllHiragana();
  //   katakanaList = await connection.getAllKatakana();

  //   setState(() {
  //     for(var hiragana in hiraganaList){
  //       starCompleted += hiragana.star;
  //     }
  //     for(var katakana in katakanaList){
  //       starCompleted += katakana.star;
  //     }

  //   });
  // }

  Future<int> _getLessons() async {
    await connection.openConnection();
    hiraganaList = await connection.getAllHiragana();
    katakanaList = await connection.getAllKatakana();

    if (hiraganaList != null) {
      lessonCompleted += hiraganaList.length;
    }
    if (katakanaList != null) {
      lessonCompleted += katakanaList.length;
    }

    return lessonCompleted;
  }

  Future<int> _getStars() async {
    await connection.openConnection();
    hiraganaList = await connection.getAllHiragana();
    katakanaList = await connection.getAllKatakana();

    for (var hiragana in hiraganaList) {
      starCompleted += hiragana.star;
    }
    for (var katakana in katakanaList) {
      starCompleted += katakana.star;
    }
    return starCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Text(
              'Lessons Completed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          FutureBuilder(
              future: _getLessons(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          '${snapshot.data}/$totalLesson',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                      )
                    : CircularProgressIndicator();
              }),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Text(
              'Stars Obtained',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          FutureBuilder(
              future: _getStars(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          '${snapshot.data}/$totalStar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                      )
                    : CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
