import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/modules/user/domain/entities/user_data.dart';
import 'package:projeto_integrador4/modules/user/domain/errors/user_errors.dart';

abstract interface class UserRepository {
 Future<Result<UserErrors, List<UserData>>> getAllUsers();
}