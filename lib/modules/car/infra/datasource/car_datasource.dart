import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';

import '../../../../core/constants/typedef.dart';

abstract interface class CarDatasource {
  Future<List<ApiResponse>> getAllCars();
  Future<ApiResponse> getCarById(int id);
  Future<ApiResponse> createCarro(Car carro);
  Future<ApiResponse> updateCarro(Car carro);
  Future<ApiResponse> deleteCarro(Car carro);
}
