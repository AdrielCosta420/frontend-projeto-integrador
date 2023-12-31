import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';

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

  @override
  Future<ApiResponse> createCarro(Car carro) async {
    try {
      return await api.post(url: 'saveCarro', data: carro.toMap());
    } on HttpsFailure catch (e) {
      throw CarErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'CarDatasourceImpl',
        methodName: 'createCarro',
      );
    } on Exception catch (e) {
      throw CarErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'CarDatasourceImpl',
        methodName: 'createCarro',
      );
    }
  }
  
  @override
  Future<ApiResponse> deleteCarro(Car carro) async {
    try {
      return await api.delete(url: 'deleteCarro/${carro.id}');
    } on HttpsFailure catch (e) {
      throw CarErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'CarDatasourceImpl',
        methodName: 'deleteCarro',
      );
    } on Exception catch (e) {
      throw CarErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'CarDatasourceImpl',
        methodName: 'deletePessoa',
      );
    }
  }
  
  @override
  Future<ApiResponse> updateCarro(Car carro) async {
    try {
      final response = await api.put(
          url: 'atualizarPessoa/${carro.id}', data: carro.toMap());
      return response;
    } on HttpsFailure catch (e) {
      throw CarErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'CarDatasourceImpl',
        methodName: 'updateCarro',
      );
    } on Exception catch (e) {
      throw CarErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'PessoaDatasourceImpl',
        methodName: 'updatePessoa',
      );
    }
  }
}
