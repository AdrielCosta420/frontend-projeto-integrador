import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';
import 'package:projeto_integrador4/modules/car/domain/repositories/car_repository.dart';

class DeleteCarroStore extends Store<String> {
  final repository = injector.get<CarRepository>();
  final carroStore = injector.get<CarrosStore>();
  DeleteCarroStore() : super('');

  Future<void> deleteCarro(Car carro) async {
    setLoading(true);

    final response = await repository.deleteCarro(carro);

    response.fold(
      (error) => error.messageError,
      (success) {
        update(success);
        carroStore.getAllCar();
        SnackBar(
          content: Text(
            success.toString(),
          ),
        );
      },
    );
    setLoading(false);
  }
}
