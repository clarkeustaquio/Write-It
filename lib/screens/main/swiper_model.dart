import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:drawing_machine/utils/constants.dart';

class SwiperModel extends StatefulWidget {
  final Function changeValue;

  SwiperModel(this.changeValue);
  @override
  _SwiperModelState createState() => _SwiperModelState(changeValue);
}

class _SwiperModelState extends State<SwiperModel> {
  Function changeValue;
  final constant = Constants();

  _SwiperModelState(this.changeValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        itemCount: constant.swiperImages.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(constant.swiperImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        onIndexChanged: (value) {
          setState(() {
            changeValue(value);
          });
        },
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
