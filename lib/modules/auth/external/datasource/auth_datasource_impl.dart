import 'package:projeto_integrador4/core/api/api_request.dart';
import 'package:projeto_integrador4/core/constants/typedef.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/auth/domain/entities/credentials.dart';
import 'package:projeto_integrador4/modules/auth/infra/datasource/auth_datasource.dart';

import '../../../../core/api/https_failure.dart';
import '../../domain/errors/login_errors.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final api = injector.get<ApiRequest>();

  @override
  Future<ApiResponse> login({required Credentials credentials}) async {
    try {
      return await api.post(url: 'login', data: credentials.toMap());
    } on HttpsFailure catch (e) {
      throw LoginError(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'AuthDatasourceImpl',
        methodName: 'login',
      );
    } on Exception catch (e) {
      throw LoginError(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'AuthDatasourceImpl',
        methodName: 'login',
      );
    }
  }
}
