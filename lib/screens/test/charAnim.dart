import 'package:drawing_machine/utils/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class PreviewChar extends StatelessWidget {
  final String imagePath;
  final Function preview;

  final Function getCurrStroke;

  PreviewChar(this.imagePath, this.preview, this.getCurrStroke);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: preview,
        onPanDown: (DragDownDetails details) {
          preview();
        },
        child: Container(
          width: Constants.canvasSize * 0.9,
          height: 350,
          child: Stack(
            children: <Widget>[
              for (int i = 1; i < getCurrStroke(); i++)
                FlareActor(
                  imagePath,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  animation: "succession" + i.toString(),
                  color: Colors.black,
                ),
              FlareActor(
                imagePath,
                alignment: Alignment.center,
                fit: BoxFit.fill,
                animation: "stroke" + getCurrStroke().toString(),
                color: Colors.grey[500],
              ),
            ],
          ),
        ));
  }
}
