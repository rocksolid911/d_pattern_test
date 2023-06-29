import 'dart:math';

import 'package:d_pattern_test/shape%20generator/shape.dart';
import 'package:flutter/material.dart';

import '../debug_logger.dart';

class Rectangle extends Shape {
  late double _width;
  late double _height;
  final logger = DebugLogger();
  Rectangle(Color color,{required Point position,
    required double height, required double width}) {
    setColor = color;
    setName = 'Rectangle';
    _width = width;
    _height = height;
    setVertices = <Point>[];
   getVertices.add(position);
    getVertices.add(Point(position.x + width, position.y));
    getVertices.add(Point(position.x, position.y - height));
    getVertices.add(Point(position.x + width, position.y - height));
  }

  @override
  void draw(Canvas canvas) {
    var paint = Paint()
      ..color = getColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
        Offset(getVertices[0].x.toDouble(), getVertices[0].y.toDouble()) &
        Size(_width, _height),
        paint);
    logger.log('Rectangle drawn with point ${getVertices[0]} and width $_width and height $_height');
  }

  @override
  double getArea() {
    logger.log('Rectangle area is ${_width * _height}');
    return _width * _height;
  }
}