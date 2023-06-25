import 'package:flutter/material.dart';

import 'debug_logger.dart';
import 'file_manager.dart';
import 'number_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var r ;
  // void _incrementCounter() {
  //   final logger = DebugLogger();
  //   setState(() {
  //     logger.log('counter is: $_counter', 'sample error message');
  //     _counter++;
  //   });
  // }

   generateNumber() {
    final numberGenerator_1 = NumberGenerator();
    final numberGenerator_2 = NumberGenerator();
    final logger = DebugLogger();
    setState(() {
      logger.log('number is: ${numberGenerator_1.generateNumber()}', 'sample error message');
    });
    return r = numberGenerator_1.generateNumber();
    //instance will be call 2 times one for log and one for return but the nos will generate
     //only once i.e in consolw it will log 4,and in app 5 and so on
  }

  generateAndWriteNumber() async {
    final numberGenerator_1 = NumberGenerator();
    final logger = DebugLogger();
    final number = numberGenerator_1.generateNumber();
    await FileManager().writeFile(number.toString(), 'assets/log_1.txt');
    logger.log('number is: $number', 'sample error message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'generated no is $r',
              style: Theme.of(context).textTheme.headline4,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: generateNumber,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: generateAndWriteNumber,
                    tooltip: 'Increment',
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
