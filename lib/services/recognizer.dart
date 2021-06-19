import 'dart:typed_data';
import 'dart:ui' as ui;

// import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/rendering.dart';

import 'package:image/image.dart' as img;

class Recognizer {
  //load tflite
  loadModel(String charClass) async {
    await Tflite.loadModel(
      model: 'assets/tensorflow_model/$charClass/' +
          charClass +
          '_model_data.tflite',
      labels: 'assets/tensorflow_model/$charClass/labels.txt',
    );
  }

  //close tflite
  close() {
    Tflite.close();
  }

  void recognize(RenderRepaintBoundary renderRepainBoundary,
      Function toggleRunning) async {
    ui.Image image = await renderRepainBoundary.toImage(pixelRatio: 1);

    var data = await image.toByteData(format: ui.ImageByteFormat.png);

    // var imageBytes = data.buffer;
    var imageBytes = data.buffer;

    img.Image oriImage = img.decodePng(imageBytes.asUint8List());
    img.Image resizedImage = img.copyResize(oriImage, height: 224, width: 224);
    // setState(() {
    //   _img = data;
    // });
    // print(_img.buffer.asUint8List());
    checkImage(resizedImage, toggleRunning);
  }

  checkImage(img.Image image, toggleRunning) async {
    var output = await Tflite.runModelOnBinary(
      binary: imageToByteListFloat32(image, 224, 127.5, 127.5),
      numResults: 2,
      threshold: 0.1,
    );

    toggleRunning(output);
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  // Uint8List imageToByteListUint8(img.Image image, int inputSize) {
  //   var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
  //   var buffer = Uint8List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //   for (var i = 0; i < inputSize; i++) {
  //     for (var j = 0; j < inputSize; j++) {
  //       var pixel = image.getPixel(j, i);
  //       buffer[pixelIndex++] = img.getRed(pixel);
  //       buffer[pixelIndex++] = img.getGreen(pixel);
  //       buffer[pixelIndex++] = img.getBlue(pixel);
  //     }
  //   }
  //   return convertedBytes.buffer.asUint8List();
  // }

  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }

}
