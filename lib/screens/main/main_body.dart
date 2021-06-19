import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:drawing_machine/screens/main/body.dart';
import 'package:drawing_machine/screens/bottom_navigation/progress.dart';
import 'package:drawing_machine/screens/bottom_navigation/chart.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  List items = [
    MenuItem(
        x: -1.0,
        name: 'lessons',
        color: Colors.lightBlue[100],
        index: 0,
        screenName: 'Lessons'),
    MenuItem(
        x: 0.0,
        name: 'chart',
        color: Colors.purple,
        index: 1,
        screenName: 'Chart'),
    MenuItem(
        x: 1.0,
        name: 'progress',
        color: Colors.greenAccent,
        index: 2,
        screenName: 'Progress'),
  ];

  MenuItem active;

  @override
  void initState() {
    super.initState();

    active = items[0]; // <-- 1. Activate a menu item
  }

  int _currentIndex = 0;
  final List<Widget> bottomNavigations = <Widget>[
    Body(),
    Chart(),
    Progress(),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Write it! Kana',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffcd5c5c),
        // flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: <Color>[Colors.red, Colors.white]))

        //             ),
      ),
      body: bottomNavigations[_currentIndex],
      backgroundColor: Colors.grey.shade200,
      // bottomNavigationBar:
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white70,
          // border:
          //     Border(top: BorderSide(color: Color(0xffdc143c), width: 1))
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              alignment: Alignment(active.x, -1),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 8,
                width: w * 0.3333333,
                color: active.color,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: items.map((item) {
                  return _flare(item);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Container(
                height: 40,
                child: FlareActor(
                  'assets/nav_icons/${item.name}.flr',
                  antialias: false,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: item.name == active.name ? 'play' : 'idle',
                ),
              ),
              Text(item.screenName)
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _currentIndex = item.index;
          active = item;
        });
      },
    );
  }
}

class MenuItem {
  final String name;
  final String screenName;
  final Color color;
  final double x;
  final int index;
  MenuItem({this.name, this.color, this.x, this.index, this.screenName});
}
