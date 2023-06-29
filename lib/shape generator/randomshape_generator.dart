import 'dart:math' as math;

import 'package:d_pattern_test/shape%20generator/shape.dart';
import 'package:d_pattern_test/shape%20generator/t.dart';
import 'package:flutter/material.dart';

import '../debug_logger.dart';

class RandomShapeGenerator{
  static Shape generateShape(){
    var random = math.Random();
    var randomShape = random.nextInt(3);
    var randomColor = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    var randomPosition = math.Point(random.nextInt(300).toDouble(), random.nextInt(300).toDouble());
    var randomHeight = random.nextInt(300).toDouble();
    var randomWidth = random.nextInt(300).toDouble();
    var randomRadius = random.nextInt(300).toDouble();
    var randomV1 = math.Point(random.nextInt(300).toDouble(), random.nextInt(300).toDouble());
    var randomV2 = math.Point(random.nextInt(300).toDouble(), random.nextInt(300).toDouble());
    var randomV3 = math.Point(random.nextInt(300).toDouble(), random.nextInt(300).toDouble());
    switch(randomShape){
      case 0:
        return Rectangle(randomColor, position: randomPosition, height: randomHeight, width: randomWidth);
      case 1:
        return Circle(randomColor, position: randomPosition, radius: randomRadius);
      case 2:
        return Triangle(randomColor,  randomV1,  randomV2,  randomV3);
      default:
        return NullShape();
    }
  }
}