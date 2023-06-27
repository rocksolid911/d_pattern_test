//write code to read and write files
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';


  class FileManager {
  static FileManager? _instance;
  FileManager._internal() {
    _instance = this;
  }
  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> readFileFromAssets(String filePath) async {
    final directory = await getApplicationSupportDirectory();
    final file =  File('${directory.path}/$filePath');
    debugPrint('<FileManager> readFileFromAssets');
    if (await file.exists()) {
      return await file.readAsString();
    }

    return await rootBundle.loadString(filePath);
  }

  Future<void> writeFile(String content, String filePath) async {
    final directory = await getApplicationSupportDirectory();
    final file =  File('${directory.path}/$filePath');
    await file.writeAsString(content,mode: FileMode.append);
  }
  }