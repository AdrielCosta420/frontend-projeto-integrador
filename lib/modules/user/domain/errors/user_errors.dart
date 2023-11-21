
import 'package:projeto_integrador4/core/errors/app_error.dart';

class UserErrors extends AppError{
  UserErrors({required super.messageError, required super.showMessage, required super.fileName, required super.methodName});
  
}