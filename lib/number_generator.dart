import 'package:flutter/cupertino.dart';

class NumberGenerator{
//eager instatntiation with _instance define before hand
 static NumberGenerator? _instance = NumberGenerator._internal();
 //lazy instatntiation with _instance define after checking if it is null
 //static NumberGenerator? _instance;
// factory NumberGenerator() => _instance ?? NumberGenerator._internal();
  NumberGenerator._internal(){
    debugPrint('<NumberGenerator> creation');
    _instance = this;
  }
  factory NumberGenerator() => _instance ?? NumberGenerator._internal();

  int _currentNumber = 0;
  int generateNumber() {
    debugPrint('<NumberGenerator> creation method');
    return _currentNumber++;
  }
}