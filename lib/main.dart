import 'package:d_pattern_test/shape_page.dart';
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
  var r ;

   generateNumber() {
    final numberGenerator_1 = NumberGenerator();
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
    //await FileManager().writeFile(number.toString(), 'log_1.txt');
    logger.log('number is: $number', 'sample error message');
  }

  readFromFile() async {
    final logger = DebugLogger();
    final content = await FileManager().readFileFromAssets('log_1.txt');
    setState(() {
      r = content;
    });
    print(content);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
       actions: [
         IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>ShapePage()));
         }, icon: Icon(Icons.near_me))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '$r\n',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                    onPressed: readFromFile,
                    tooltip: 'Increment',
                    backgroundColor: Colors.purple,
                    child: const Icon(Icons.safety_check),
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
