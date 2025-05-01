import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LogService {
  static final Logger _logger = Logger();
  static late File _logFile;

  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    _logFile = File('${directory.path}/app.log');
  }

  static void log(String message) {
    _logger.i(message);
    _logFile.writeAsStringSync('$message\n', mode: FileMode.append);
  }

  static Future<List<String>?> getLogs() async {
    try {
      var logFileContentList = await _logFile.readAsLines();
      if (logFileContentList.length >= 6) {
        await _logFile.delete();
      }
      return logFileContentList;
    } on PathNotFoundException {
      debugPrint("Path Doesn't Exist <======");
      return null;
    }
  }
}
