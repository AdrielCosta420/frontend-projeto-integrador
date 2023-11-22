import '../../../../core/constants/typedef.dart';

abstract interface class CarDatasource {
  Future<List<ApiResponse>> getAllCars();
    Future<ApiResponse> getCarById(int id);
}
