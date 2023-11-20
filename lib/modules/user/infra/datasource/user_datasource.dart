import 'package:projeto_integrador4/core/constants/typedef.dart';

abstract interface class UserDatasource {
  Future<ApiResponse> getUser(int id);
}
