import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/repositories/car_repository.dart';
import '../../../modules/car/domain/entities/car.dart';

class CriarCarroStore extends Store<Car> {
  final repository = injector.get<CarRepository>();
  final carroStore = injector.get<CarrosStore>();
  CriarCarroStore() : super(Car());

  Future<void> createCarro(Car carro) async {
    setLoading(true);
    final response = await repository.createCarro(carro);

    response.fold((error) => error.showMessage, (success) {
      update(success);
      carroStore.getAllCar();
    });
    setLoading(false);
  }

  Future<void> updateCarro(Car carro) async {
    setLoading(true);
    final response = await repository.updateCarro(carro);

    response.fold((error) => error.showMessage, (success) {
      update(success);
      carroStore.getAllCar();
    });
    setLoading(false);
  }
}
