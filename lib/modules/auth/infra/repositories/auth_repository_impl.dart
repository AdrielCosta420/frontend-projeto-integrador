import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/auth/domain/entities/credentials.dart';
import 'package:projeto_integrador4/modules/auth/domain/errors/login_errors.dart';
import 'package:projeto_integrador4/modules/auth/domain/repositories/auth_repository.dart';
import 'package:projeto_integrador4/modules/auth/infra/datasource/auth_datasource.dart';
import 'package:projeto_integrador4/modules/user/domain/entities/user_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final datasource = injector.get<AuthDatasource>();

  @override
  Future<Result<LoginError, UserData>> login(
      {required Credentials credentials}) async {
    try {
      final response = await datasource.login(credentials: credentials);

      return Result.success(UserData.fromMap(response));
    } on LoginError catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        LoginError(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'LoginRepositoryImpl',
          methodName: 'login',
        ),
      );
    }
  }

  
}
