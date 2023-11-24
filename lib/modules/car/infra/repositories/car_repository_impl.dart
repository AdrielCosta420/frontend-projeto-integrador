import '../../../../core/result/result_custom.dart';
import '../../../../injectable.dart';

import '../../domain/entities/car.dart';

import '../../domain/errors/car_errors.dart';
import '../datasource/car_datasource.dart';

import '../../domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final datasource = injector.get<CarDatasource>();

  @override
  Future<Result<CarErrors, List<Car>>> getAllCar() async {
    try {
      final response = await datasource.getAllCars();
      final listCar = <Car>[];

      for (var element in response) {
        listCar.add(Car.fromMap(element));
      }
      return Result.success(listCar);
    } on CarErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        CarErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'CarRepositoryImpl',
          methodName: 'getAllCar',
        ),
      );
    }
  }

  @override
  Future<Result<CarErrors, Car>> getCarById(int id) async {
    try {
      final response = await datasource.getCarById(id);

      return Result.success(Car.fromMap(response));
    } on CarErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        CarErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'CarRepositoryImpl',
          methodName: 'getCarById',
        ),
      );
    }
  }

  @override
  Future<Result<CarErrors, Car>> createCarro(Car carro) async {
    try {
      final response = await datasource.createCarro(carro);

      return Result.success(Car.fromMap(response));
    }  on CarErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        CarErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'CarRepositoryImpl',
          methodName: 'createCarro',
        ),
      );
    }
  }
  
  @override
  Future<Result<CarErrors, String>> deleteCarro(Car carro) async {
       try {
      final response = await datasource.deleteCarro(carro);

      return Result.success(response['message']);
    } on CarErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        CarErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'CarRepositoryImpl',
          methodName: 'deleteCarro',
        ),
      );
    }
  }
  
  @override
  Future<Result<CarErrors, Car>> updateCarro(Car carro) async {
     try {
      final response = await datasource.updateCarro(carro);

      return Result.success(Car.fromMap(response));
    } on CarErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        CarErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'PessoaRepositoryImpl',
          methodName: 'updatePessoa',
        ),
      );
    }
  }
}
