import 'package:projeto_integrador4/core/api/api_request.dart';
import 'package:projeto_integrador4/core/constants/typedef.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/user/infra/datasource/user_datasource.dart';

import '../../../../core/api/https_failure.dart';
import '../../../auth/domain/errors/login_errors.dart';

class UserDatasourceImpl implements UserDatasource {
  final api = injector.get<ApiRequest>();

  @override
  Future<ApiResponse> getUser(int id) async {
    try {
      return await api.get(url: 'users', queryParameters: {'id': id});
    } on HttpsFailure catch (e) {
      throw LoginError(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'AuthDatasourceImpl',
        methodName: 'getUser',
      );
    } on Exception catch (e) {
      throw LoginError(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'AuthDatasourceImpl',
        methodName: 'getUser',
      );
    }
  }
}
