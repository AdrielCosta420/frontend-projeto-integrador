import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/injectable.dart';

import 'package:projeto_integrador4/modules/user/domain/entities/user_data.dart';

import 'package:projeto_integrador4/modules/user/domain/errors/user_errors.dart';
import 'package:projeto_integrador4/modules/user/infra/datasource/user_datasource.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final datasource = injector.get<UserDatasource>();

  @override
  Future<Result<UserErrors, List<UserData>>> getAllUsers() async {
    try {
      final response = await datasource.getAllUsers();
      final userList = <UserData>[];

      for (var element in response) {
        userList.add(UserData.fromMap(element));
      }
      return Result.success(userList);
    } on UserErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        UserErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'UserRepositoryImpl',
          methodName: 'getAllUsers',
        ),
      );
    }
  }
}
