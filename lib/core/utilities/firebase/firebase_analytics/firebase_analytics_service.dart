import 'package:firebase_analytics/firebase_analytics.dart';

abstract class FirebaseAnalyticsService {
  static final FirebaseAnalytics _firebaseAnalytics =
      FirebaseAnalytics.instance;

  static void logEvent(
      {required String eventName, Map<String, Object>? parameters}) {
    _firebaseAnalytics.logEvent(name: eventName, parameters: parameters);
  }
}
