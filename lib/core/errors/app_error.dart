import 'package:flutter/foundation.dart';
import '../log/log.dart';

class AppError implements Exception {
  final String messageError;
  final String showMessage;
  final String? codeError;
  final StackTrace? stackTrace;
  final String fileName;
  final String methodName;

  AppError({
    required this.messageError,
    required this.showMessage,
    required this.fileName,
    this.codeError,
    this.stackTrace,
    required this.methodName,
  }) {
    if (kDebugMode) {
      Log.instance.e('''
        MessageError: $messageError \n
        ShowMessage: $showMessage \n
        CodeError: $codeError \n
        StackTrace: $stackTrace \n
        File Name: $fileName \n
        Method Name: $methodName \n
        ''');
    }
  }
}
