import 'package:d_pattern_test/file_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart' show DateFormat;

/// Abstract logger class to showcase creation of a Singleton
/// wrapper as an extension
///
abstract class BaseLogger {
  @protected
  late Logger _logger_1;
  @protected
  final DateFormat _dateFormatter = DateFormat('H:m:s.S');
  static const appName = 'singleton_pattern_example';

  void log(message, [Object? error, StackTrace? stackTrace]) =>
      _logger_1.w(message, error, stackTrace);
}

/// Singleton wrapper by extension
class DebugLogger extends BaseLogger {
  static DebugLogger? _instance;

  ///
  /// private constructor
  DebugLogger._internal() {
    Logger.level = Level.debug;
  //  Logger.root.onRecord.listen(_recordHandler);
    Logger.addLogListener((event) =>_recordHandler(event));
    _logger_1 = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
    debugPrint('<DebugLogger> creation');
    _instance = this;
  }

  /// public fatory constructor
  /// lazy instantation
  factory DebugLogger() => _instance ?? DebugLogger._internal();

  /// record handler for the logging message content
  /// it is added in the private constructor
  void _recordHandler(LogEvent event) {
    FileManager().writeFile(
        ' ${_dateFormatter.format(event.time)} ${event.message}\n',
        'log_1.txt');
    debugPrint(
        '${event.level.name} ${_dateFormatter.format(event.time)} ${event.message}');
  }
}
