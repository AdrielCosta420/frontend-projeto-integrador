import 'package:projeto_integrador4/core/constants/typedef.dart';
import 'package:projeto_integrador4/modules/auth/domain/entities/credentials.dart';
import 'package:projeto_integrador4/modules/user/domain/entities/user_data.dart';

abstract interface class AuthDatasource {
  Future<ApiResponse> login({required Credentials credentials});
  Future<ApiResponse> createUser({required UserData user});
}
