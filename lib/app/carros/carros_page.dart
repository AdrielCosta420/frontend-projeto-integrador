import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';
import 'package:routefly/routefly.dart';

import '../../common/custom_menu.dart';
import '../../routes.dart';

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
      backgroundColor: Colors.grey.shade200,
      body: CustomMenu(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ScopedBuilder<CarrosStore, List<Car>>(
                      store: store,
                      onLoading: (context) {
                        return LoadingAnimationWidget.threeArchedCircle(
                          color: Colors.blue.shade500,
                          size: 70,
                        );
                      },
                      onError: (context, error) => Text(error.toString()),
                      onState: (context, state) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          crossAxisCount:
                              (MediaQuery.of(context).size.width / 300).floor(),
                          // mainAxisSpacing: 16,
                          childAspectRatio: .9,
                        ),
                        padding: const EdgeInsets.all(20),
                        itemCount: store.state.length,
                        itemBuilder: (context, index) {
                          final carro = store.state[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Color(0xFF3e20dc))),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                          splashRadius: 20),
                                      Text(
                                        '${carro.modelo}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue.shade300,
                                          ),
                                          splashRadius: 20),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(child: Text('MARCA')),
                                      Expanded(child: Text('${carro.marca}')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(child: Text('VALOR')),
                                      Expanded(
                                          child: Text('R\$${carro.valor}')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(child: Text('DESCRIÇÃO')),
                                      Expanded(
                                          child: Text('${carro.descricao}')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                          child: Text('ANO DE FABRICAÇÃO')),
                                      Expanded(
                                        child: Text(carro.anoFabricacao
                                            .toString()
                                            .toString()
                                            .substring(0, 10)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(child: Text('ANO MODELO')),
                                      Expanded(
                                        child: Text(carro.anoModelo
                                            .toString()
                                            .toString()
                                            .substring(0, 10)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Routefly.navigate(routePaths.carros.criarCarro),
        label: const Text('Adicionar novo carro'),
      ),
    );
  }
}
