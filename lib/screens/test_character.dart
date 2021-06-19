import 'package:flutter/material.dart';

class CharacterTest extends StatelessWidget{
  final String character;

  CharacterTest(this.character);
  @override
  Widget build(BuildContext context){
    return Text(
      character,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
    );
  }
}