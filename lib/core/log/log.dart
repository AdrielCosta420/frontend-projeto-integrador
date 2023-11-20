import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger? _instance;

  Log._();

  static Logger get instance {
    _instance ??= Logger();
    return _instance!;
  }

  void erro(String msg) {
    if (kDebugMode) {
      instance.e(msg);
    }
  }

  void info(String msg) {
    if (kDebugMode) {
      instance.i(msg);
    }
  }

  void verbose(String msg) {
    if (kDebugMode) {
      instance.t(msg);
    }
  }

  void debug(String msg) {
    if (kDebugMode) {
      instance.d(msg);
    }
  }

  void warning(String msg) {
    if (kDebugMode) {
      instance.w(msg);
    }
  }

  void wtf(String msg) {
    if (kDebugMode) {
      instance.f(msg);
    }
  }
}
