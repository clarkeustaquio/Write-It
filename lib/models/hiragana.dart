import 'package:flutter/foundation.dart';

class Hiragana{
  final String hiragana;
  final String time;
  final int star;

  Hiragana({
    @required this.hiragana,
    @required this.time,
    @required this.star,
  });

  Map<String, dynamic> mapHiragana() {
    return {
      'hiragana': hiragana,
      'time': time,
      'star': star,
    };
  }
}