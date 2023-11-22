import 'package:projeto_integrador4/core/api/api_request.dart';
import 'package:projeto_integrador4/core/constants/typedef.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/user/infra/datasource/user_datasource.dart';

import '../../../../core/api/https_failure.dart';
import '../../../auth/domain/errors/login_errors.dart';

class UserDatasourceImpl implements UserDatasource {
  final api = injector.get<ApiRequest>();

  @override
  Future<List<ApiResponse>> getAllUsers() async {
    try {
      final response = await api.getList(url: 'users');
      final apiResponseList = <ApiResponse>[];

      for (var element in response) {
        apiResponseList.add(element);
      }

      return apiResponseList;
    } on HttpsFailure catch (e) {
      throw LoginError(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'AuthDatasourceImpl',
        methodName: 'getAllUsers',
      );
    } on Exception catch (e) {
      throw LoginError(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'AuthDatasourceImpl',
        methodName: 'getAllUsers',
      );
    }
  }

}
