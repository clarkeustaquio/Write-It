import 'package:flutter/material.dart';
import 'package:drawing_machine/utils/constants.dart';

class Chart extends StatelessWidget {
  final Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
              child: Text(
                'Hiragana',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          for (var chart in constants.hiraganaChart)
            Row(
              children: [
                for (var i = 0; i < chart.length; i++)
                  Expanded(
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      margin: EdgeInsets.only(
                          top: 10, left: 7.5, bottom: 10.0, right: 7.5),
                      child: Column(
                        children: [
                          Center(
                              child: Text(chart[i]['symbol'],
                                  style: TextStyle(fontSize: 30.0))),
                          Center(
                              child: Text(chart[i]['character'],
                                  style: TextStyle(fontSize: 20.0))),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
              child: Text(
                'Katakana',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          for (var chart in constants.katakanaChart)
            Row(
              children: [
                for (var i = 0; i < chart.length; i++)
                  Expanded(
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      margin: EdgeInsets.only(
                          top: 10, left: 7.5, bottom: 10.0, right: 7.5),
                      child: Column(
                        children: [
                          Center(
                              child: Text(chart[i]['symbol'],
                                  style: TextStyle(fontSize: 30.0))),
                          Center(
                              child: Text(chart[i]['character'],
                                  style: TextStyle(fontSize: 20.0))),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
