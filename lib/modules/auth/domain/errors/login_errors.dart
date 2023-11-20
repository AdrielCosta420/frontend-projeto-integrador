import 'package:projeto_integrador4/core/errors/app_error.dart';

class LoginError extends AppError {
  LoginError({
    required super.messageError,
    required super.showMessage,
    required super.fileName,
    required super.methodName,
  });
}
