import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

abstract class FirebaseCrashlyticsService {
  static final FirebaseCrashlytics _firebaseCrashlytics =
      FirebaseCrashlytics.instance;

  ///Pass all uncaught "fatal" errors from the framework to Crashlytics
  static void recordFlutterFatalError(FlutterErrorDetails flutterErrorDetails) {
    _firebaseCrashlytics.recordFlutterFatalError(flutterErrorDetails);
  }

  ///Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  static bool recordErrors(error, stack) {
    _firebaseCrashlytics.recordError(error, stack, fatal: true);
    return true;
  }

  /// Log non-fatal errors and custom messages in Firebase Crashlytics
  static void logMessage(String message) {
    _firebaseCrashlytics.log(message);
  }
}
