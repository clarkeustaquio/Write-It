import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:drawing_machine/screens/main/main_body.dart';

class Board extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('assets/onboard/landing_page.png'),
                        height: 300.0,
                        width: 300.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                        'Write it! Kana',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                            fontSize: 26.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.0),
                    Container(
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
          ), 
        ),
      ),
      bottomSheet: Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => MainBody())
            );
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    color: Color(0xFF5B16D0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}