// buatkan saya kode print log utils for debug mode 

import 'package:flutter/foundation.dart';

class PrintLog {
  static void printLog(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}