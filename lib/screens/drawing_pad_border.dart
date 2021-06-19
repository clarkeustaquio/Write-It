import 'package:drawing_machine/utils/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawingBorder extends StatelessWidget {
  String _animation;
  DrawingBorder(Function getShowResult, Function drawingResult) {
    if (!getShowResult()) {
      this._animation = 'success';
    } else {
      if (!drawingResult()) {
        this._animation = 'wrong';
      } else {
        this._animation = 'correct';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.canvasSize,
      height: Constants.canvasSize,
      child: FlareActor(
        "assets/border.flr",
        alignment: Alignment.center,
        fit: BoxFit.fill,
        animation: _animation,
      ),
    );
  }
}
