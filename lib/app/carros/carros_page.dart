import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/app/carros/carros_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';

import '../../common/custom_menu.dart';

class CarrosPage extends StatefulWidget {
  const CarrosPage({super.key});

  @override
  State<CarrosPage> createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  final store = injector.get<CarrosStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMenu(
          widget: ScopedBuilder<CarrosStore, List<Car>>(
        store: store,
        onLoading: (context) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.blue.shade500,
          size: 70,
        ),
        onError: (context, error) => Text(error.toString()),
        onState: (context, state) => Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.green,
            child: ListView.builder(
                itemCount: store.state.length,
                itemBuilder: (context, index) {
                  final carro = store.state[index];
                  return Container(
                      color: Colors.blue,
                      child: Text('${carro.marca} AQQQQQQQQ'));
                }),
          ),
        ),
      )),
    );
  }
}
