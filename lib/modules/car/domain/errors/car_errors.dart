import '../../../../core/errors/app_error.dart';

class CarErrors extends AppError {
  CarErrors({
    required super.messageError,
    required super.showMessage,
    required super.fileName,
    required super.methodName,
  });
}
