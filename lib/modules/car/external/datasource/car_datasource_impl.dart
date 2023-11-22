import '../../../../core/api/api_request.dart';
import '../../../../core/constants/typedef.dart';
import '../../../../injectable.dart';
import '../../domain/errors/car_errors.dart';

import '../../../../core/api/https_failure.dart';
import '../../infra/datasource/car_datasource.dart';

class CarDatasourceImpl implements CarDatasource {
  final api = injector.get<ApiRequest>();

  @override
  Future<List<ApiResponse>> getAllCars() async {
    try {
      final response = await api.getList(url: 'carros');
      final listResponse = <ApiResponse>[];

      for (var element in response) {
        listResponse.add(element);
      }

      return listResponse;
    } on HttpsFailure catch (e) {
      throw CarErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'CarDatasourceImpl',
        methodName: 'getAllCars',
      );
    } on Exception catch (e) {
      throw CarErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'CarDatasourceImpl',
        methodName: 'getAllCars',
      );
    }
  }

  @override
  Future<ApiResponse> getCarById(int id) async {
    try {
      return await api.get(url: 'singleCarro', queryParameters: {"id": id});
    } on HttpsFailure catch (e) {
      throw CarErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'CarDatasourceImpl',
        methodName: 'getCarById',
      );
    } on Exception catch (e) {
      throw CarErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'CarDatasourceImpl',
        methodName: 'getCarById',
      );
    }
  }
}
