import 'package:flutter/material.dart';
import 'package:drawing_machine/database/connection.dart';

class Star extends StatefulWidget {
  final starSize;
  final String charClass;
  final String category;

  Star(this.starSize, this.charClass, this.category);

  @override
  _StarState createState() => _StarState(starSize, charClass, category);
}

class _StarState extends State<Star> {
  final starSize;
  final String category;
  final String charClass;
  final Connection connection = Connection();

  int starCount = 0;

  @override
  void initState() {
    super.initState();
  }

  _StarState(this.starSize, this.charClass, this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getStarCount(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(children: [
                    for (var count = 0; count < 3; count++)
                      (count < snapshot.data)
                          ? Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.star,
                                size: starSize,
                                color: Colors.yellow,
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.star_outline,
                                size: starSize,
                              ),
                            ),
                  ]))
              : CircularProgressIndicator();
        });
  }

  Future<int> _getStarCount() async {
    await connection.openConnection();

    if (charClass == 'hiragana') {
      var hiraganaStar = await connection.getHiragana(category);
      for (var star in hiraganaStar) {
        if (mounted)
          setState(() {
            starCount = star.star;
          });
      }
    } else if (charClass == 'katakana') {
      var katakanaStar = await connection.getKatakana(category);
      for (var star in katakanaStar) {
        setState(() {
          starCount = star.star;
        });
      }
    }

    return starCount;
  }
}
