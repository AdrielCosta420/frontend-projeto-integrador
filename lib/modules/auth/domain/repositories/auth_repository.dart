import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/modules/auth/domain/entities/credentials.dart';
import 'package:projeto_integrador4/modules/auth/domain/errors/login_errors.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';

abstract interface class AuthRepository {
  Future<Result<LoginError, Pessoa>> login(
      {required Credentials credentials});
}
