//write code to read and write files
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'debug_logger.dart';

  class FileManager {
  static FileManager? _instance;
  FileManager._internal() {
    _instance = this;
  }
  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> readFileFromAssets(String filePath) async {
    debugPrint('<FileManager> readFileFromAssets');
    return await rootBundle.loadString(filePath);
  }

  Future<void> writeFile(String content, String filePath) async {
    await rootBundle.loadString(filePath);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filePath');
    await file.writeAsString(content);
  }
  }