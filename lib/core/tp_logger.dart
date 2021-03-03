
import 'package:flutter/foundation.dart';

class TPLogger {
  static void log(Object object) {
    if (kDebugMode) {
      print('[Logger-TP] ${object.toString()}');
    }
  }
}