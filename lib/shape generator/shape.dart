import 'dart:math';

import 'package:flutter/material.dart';

import '../debug_logger.dart';

abstract class Shape{
  final logger = DebugLogger();

  Color _color = Colors.green;
  Color get getColor => _color;
set setColor(Color color) => _color = color;

  String _name = 'Shape';
  String get getName => _name;
  set setName(String name) => _name = name;

  List<Point> _vertices = <Point>[];
  List<Point> get getVertices => _vertices;
  set setVertices(List<Point> vertices) => _vertices = vertices;

  double getArea();

  void draw(Canvas canvas);

}


//circle
class Circle extends Shape{
  late double _radius;
  Circle(Color color,{required Point position, required double radius}){
    _color = color;
    _name = 'Circle';
    _radius = radius;
    _vertices.add(position);
  }

  @override
  void draw(Canvas canvas) {
    var paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(
        Offset(_vertices[0].x.toDouble(), _vertices[0].y.toDouble()),
        _radius,
        paint);
    logger.log('Circle drawn with point ${_vertices[0]} and radius $_radius');
  }

  @override
  double getArea() {
    double Area = pi * _radius * _radius;
    logger.log('Circle area is $Area');
    return Area;
  }
}


//nullshape
class NullShape extends Shape {
  NullShape() {
    _name = 'NullShape';
  }

  @override
  void draw(Canvas canvas) {}

  @override
  double getArea() {
   return 0.0;
  }
}

class Triangle extends Shape{
  
  Triangle(Color color,Point v1,Point v2,Point v3){
    _color = color;
    _name = 'Triangle';
    _vertices.add(v1);
    _vertices.add(v2);
    _vertices.add(v3);
  }

  @override
  void draw(Canvas canvas) {
    var paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final path = Path();
    path.moveTo(_vertices[0].x.toDouble(), _vertices[0].y.toDouble());
    path.lineTo(_vertices[1].x.toDouble(), _vertices[1].y.toDouble());
    path.lineTo(_vertices[2].x.toDouble(), _vertices[2].y.toDouble());
    path.lineTo(_vertices[0].x.toDouble(), _vertices[0].y.toDouble());
    canvas.drawPath(path, paint);
    logger.log('Triangle drawn with points ${_vertices[0]},${_vertices[1]},${_vertices[2]}');
  }

  @override
  double getArea() {
    Point v1 = _vertices[0];
    Point v2 = _vertices[1];
    Point v3 = _vertices[2];
    num area;
    area = v1.x * (v2.y - v3.y) + v2.x * (v3.y - v1.y) + v3.x * (v1.y - v2.y);
    logger.log('Triangle area is $area');
    return area.toDouble();
  }
  
}
