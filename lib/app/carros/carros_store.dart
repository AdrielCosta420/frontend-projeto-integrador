import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/repositories/car_repository.dart';

import '../../modules/car/domain/entities/car.dart';

class CarrosStore extends Store<List<Car>> {
  final repository = injector.get<CarRepository>();
  CarrosStore() : super([]) {
    getAllCar();
  }

  Future<void> getAllCar() async {
    setLoading(true);
    final response = await repository.getAllCar();

    response.fold(
      (error) => error.messageError,
      (success) => success,
    );
    setLoading(false);
  }
}
