import 'package:flutter/foundation.dart';

class Katakana{
  final String katakana;
  final String time;
  final int star;

  Katakana({
    @required this.katakana,
    @required this.time,
    @required this.star,
  });

  Map<String, dynamic> mapKatakana() {
    return {
      'katakana': katakana,
      'time': time,
      'star': star,
    };
  }
}