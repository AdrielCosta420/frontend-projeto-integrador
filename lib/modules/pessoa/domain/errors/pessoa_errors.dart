
import '../../../../core/errors/app_error.dart';

class PessoaErrors extends AppError{
  PessoaErrors({required super.messageError, required super.showMessage, required super.fileName, required super.methodName});
  
}