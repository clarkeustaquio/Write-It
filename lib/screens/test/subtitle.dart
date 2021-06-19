import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final Function getStrokes;
  final Function getCurrStroke;
  final String label;
  final bool putSuperscript;

  Subtitle(
      this.label, this.getStrokes, this.getCurrStroke, this.putSuperscript);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Text>[
          Text(
            label,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          (!putSuperscript)
              ? Text(getStrokes().toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ))
              : Text(
                  (getCurrStroke() == getStrokes() + 1)
                      ? getStrokes().toString() + superScript(getStrokes())
                      : getCurrStroke().toString() +
                          superScript(getCurrStroke()),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
        ],
      ),
    );
  }

  String superScript(int num) {
    switch (num) {
      case 1:
        return '\u02e2\u1d57';
      case 2:
        return '\u207f\u1d48';
      case 3:
        return '\u02b3\u1d48';
      default:
        return '\u1d57\u02b0';
    }
  }
}
