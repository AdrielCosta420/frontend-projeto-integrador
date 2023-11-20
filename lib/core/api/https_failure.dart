import 'package:dio/dio.dart';
import '../errors/app_error.dart';

class HttpsFailure extends AppError {
  final int? code;
  final String? error;
  final String method;
  final StackTrace? stack;

  HttpsFailure({
    required this.code,
    required this.error,
    required this.method,
    this.stack,
  }) : super(
          messageError: error ?? 'ERROR DESCONHECIDO',
          showMessage: error.toString(),
          codeError: code.toString(),
          fileName: 'HttpsFailure',
          stackTrace: stack,
          methodName: method,
        );

  factory HttpsFailure.fromDioException(DioException error) {
    var errorList = <String>[];
    if (error.response?.data.runtimeType == String) {
      errorList.add(error.response?.data);
      errorList.add(error.message.toString());
    } else if ((error.response?.data?['errors'].runtimeType == String)) {
      errorList.add(error.response?.data?['errors']);
    } else {
      final errors = error.response?.data?['errors'] as Map<String, dynamic>?;
      errorList = errors != null ? errors.entries.map((entry) => entry.value.toString()).toList() : <String>[];
    }

    return HttpsFailure(
      code: error.response?.statusCode,
      error: error.message,
      
      stack: error.stackTrace,
      method: error.type.toString(),
    );
  }
}
