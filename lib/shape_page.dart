import 'package:d_pattern_test/shape%20generator/randomshape_generator.dart';
import 'package:d_pattern_test/shape%20generator/shape.dart';
import 'package:flutter/material.dart';

Shape currShape =NullShape();

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

class ShapePage extends StatefulWidget {
  const ShapePage({super.key});

  @override
  State<ShapePage> createState() => _ShapePageState();
}

class _ShapePageState extends State<ShapePage> {

  @override
  Widget build(BuildContext context) {
    print('ShapePage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Method Pattern'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: ListView(children: <Widget>[
        Text(
          '${currShape.getName}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: CanvasPainter(),
          ),
        ),
        ElevatedButton(
          style: raisedButtonStyle,
          child: const Text('Generate New Random Shape'),
          onPressed: () {
            setState(() {
              currShape = RandomShapeGenerator.generateShape();
            });
          },
        ),
      ]),
    );
  }
}
class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    currShape.draw(canvas);
    currShape.getArea();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}