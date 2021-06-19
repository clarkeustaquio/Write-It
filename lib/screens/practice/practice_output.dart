import 'package:drawing_machine/screens/charset_menu.dart';
import 'package:drawing_machine/screens/practice/main_practice.dart';
import 'package:drawing_machine/screens/test/main_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeOutput extends StatelessWidget {
  final List charset;
  final String charClass;
  final Stopwatch stopWatch;
  final String category;

  PracticeOutput(
      {@required this.charset,
      @required this.charClass,
      @required this.stopWatch,
      @required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcd5c5c),
        title: Text('Write it! Kana'),
        leading: BackButton(
          onPressed: () {
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
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/practice_output_pic/swiper2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Contents Practiced: ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(_content(),
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ))),
          Column(
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
                              category: category,
                            )));
                  },
                  child: Text('Retry'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Test(
                              charset: charset,
                              charClass: charClass,
                              stopWatch: stopWatch,
                              category: category,
                            )));
                  },
                  child: Text('Test'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String _content() {
    String str = '';
    for (var i in charset) {
      str += i['label'] + '   ';
    }
    return str;
  }
}
