import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';
import 'package:projeto_integrador4/modules/car/domain/errors/car_errors.dart';

abstract interface class CarRepository {
  Future<Result<CarErrors, List<Car>>> getAllCar();
  Future<Result<CarErrors, Car>> getCarById(int id);
  Future<Result<CarErrors, Car>> createCarro(Car carro);
  Future<Result<CarErrors, Car>> updateCarro(Car carro);
  Future<Result<CarErrors, String>> deleteCarro(Car carro);

}
