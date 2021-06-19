import 'package:flutter/material.dart';
import 'package:drawing_machine/utils/constants.dart';

class StarOutput extends StatefulWidget{
  final starSize;
  final int starCount;

  StarOutput(this.starSize, this.starCount);

  @override
  _StarOutputState createState() => _StarOutputState(starSize, starCount);
}

class _StarOutputState extends State<StarOutput>{
  final starSize;
  final int starCount;

  final Constants constants = Constants();

  @override
  void initState(){
    super.initState();
  }

  _StarOutputState(this.starSize, this.starCount);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top:5),
      child: Row(
        children: [
          for(var count = 0; count < 3; count++)
            (count < starCount) ? Container(
              margin: EdgeInsets.only(right:5),
              child: Icon(Icons.star, size: starSize, color: Colors.yellow,),
            ) : Container(
              margin: EdgeInsets.only(right:5),
              child: Icon(Icons.star_outline, size: starSize,),
            ),
          ]
        )
    );
  }
}