import 'package:flutter/material.dart';

import 'package:drawing_machine/utils/constants.dart';
import 'package:drawing_machine/screens/main/swiper_model.dart';
import '../charset_menu.dart';

import 'package:drawing_machine/database/connection.dart';
import 'package:drawing_machine/screens/star_output.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Connection connection = Connection();
  final constant = Constants();
  var indexValue = 0;
  var categories = Constants().hiraganas;
  String charClass = 'hiragana';
  var charsets = Constants().hiraganaCharsets;
  var indexIdentifier = 'hiragana';

  var hiraganaList;
  var katakanaList;

  void changeValue(int value) {
    setState(() {
      indexValue = value;
      if (indexValue == 0) {
        categories = constant.hiraganas;
        charsets = constant.hiraganaCharsets;
        charClass = 'hiragana';
      } else {
        categories = constant.katakanas;
        charClass = 'katakana';
        charsets = constant.katakanaCharsets;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataList();
  }

  void _getDataList() async {
    await connection.openConnection();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                      child: Text(
                        'Featured - $charClass',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SwiperModel(changeValue),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        for (var i = 0; i < categories.length; i++)
                          Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            width: double.infinity,
                            child: ListTile(
                              title: Text(categories[i]),
                              subtitle: (indexValue == 0)
                                  ? FutureBuilder(
                                      future: (connection.database != null)
                                          ? connection
                                              .getHiragana(categories[i])
                                          : null,
                                      builder: (context, snapshot) {
                                        Widget widget;
                                        if (snapshot.data != null) {
                                          if (snapshot.data.length > 0)
                                            widget = StarOutput(
                                                25.0, snapshot.data[0].star);
                                          else
                                            widget = Container();
                                        } else {
                                          widget = Container();
                                        }
                                        return snapshot.hasData
                                            ? widget
                                            : Container();
                                      },
                                    )
                                  : FutureBuilder(
                                      future: (connection.database != null)
                                          ? connection
                                              .getKatakana(categories[i])
                                          : null,
                                      builder: (context, snapshot) {
                                        Widget widget;
                                        if (snapshot.data != null) {
                                          if (snapshot.data.length > 0)
                                            widget = StarOutput(
                                                25.0, snapshot.data[0].star);
                                          else
                                            widget = Container();
                                        } else {
                                          widget = Container();
                                        }
                                        return snapshot.hasData
                                            ? widget
                                            : Container();
                                      },
                                    ),
                              leading: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid),
                                ),
                                child: Center(
                                    child: Text(
                                  charsets[i][0]['label'],
                                  style: TextStyle(fontSize: 25.0),
                                )),
                              ),
                              trailing: FlatButton(
                                child: Text('Play',
                                    style: TextStyle(color: Color(0xFFDC143C))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CharsetMenu(
                                            charset: charsets[i],
                                            charClass: charClass,
                                            category: categories[i])),
                                  );
                                },
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
