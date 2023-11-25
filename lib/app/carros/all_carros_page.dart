import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/app/carros/stores/criar_carro_store.dart';
import 'package:projeto_integrador4/app/carros/stores/delete_carro_store.dart';
import 'package:projeto_integrador4/app/users/stores/criar_pessoa_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/car/domain/entities/car.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
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
  final updateCarro = injector.get<CriarCarroStore>();
  final deleteCarro = injector.get<DeleteCarroStore>();
  final upPessoa = injector.get<CriarPessoaStore>();

  @override
  void initState() {
    store.getAllCar();
    super.initState();
  }

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
                          childAspectRatio: .8,
                        ),
                        padding: const EdgeInsets.all(20),
                        itemCount: store.state.length,
                        itemBuilder: (context, index) {
                          final carro = store.state[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Visibility(
                              visible: carro.carroInteresse == false,
                              child: InkWell(
                                onTap: () => showCarDetails(context, carro),
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: ShapeDecoration(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                        color: Color(0xFF3e20dc),
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () => showDeleteCarro(
                                                  context, carro),
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
                                              onPressed: () =>
                                                  editCarro(context, carro),
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
                                          Expanded(
                                              child: Text('${carro.marca}')),
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
                                          const Expanded(
                                              child: Text('DESCRIÇÃO')),
                                          Expanded(
                                              child:
                                                  Text('${carro.descricao}')),
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
                                          const Expanded(
                                              child: Text('ANO MODELO')),
                                          Expanded(
                                            child: Text(carro.anoModelo
                                                .toString()
                                                .toString()
                                                .substring(0, 10)),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            carro.carroInteresse = true;
                                          });
                                          //  store.getAllCar();

                                          //TDODO REMOVER

                                          //         store.getAllCar();
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.favorite_border),
                                            Text('INTERESSE')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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

  void demonstrarInteresse(
      Car carro, String nome, String telefone, Pessoa pessoa) {
    carro.copyWith(carroInteresse: true);
    pessoa.copyWith(nome: nome);
    pessoa.copyWith(telefone: telefone);
  }

  void showDeleteCarro(BuildContext context, Car carro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Tem certeza que deseja excluir ${carro.modelo}?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                deleteCarro.deleteCarro(carro);

                Navigator.of(context).pop(); // Fecha o modal
              },
              child: const Text('Confirmar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o modal
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void editCarro(BuildContext context, Car carro) {
    TextEditingController marcaController =
        TextEditingController(text: carro.marca);
    TextEditingController modeloController =
        TextEditingController(text: carro.modelo);
    TextEditingController descricaoController =
        TextEditingController(text: carro.descricao);
    TextEditingController anoModeloController = TextEditingController(
        text: DateTime.parse(carro.anoModelo.toString().substring(0, 10))
            .toString());
    TextEditingController anoFabricacaoController = TextEditingController(
        text: DateTime.parse(carro.anoFabricacao.toString().substring(0, 10))
            .toString());
    TextEditingController valorController =
        TextEditingController(text: carro.valor.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Carro'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: marcaController,
                  decoration: const InputDecoration(labelText: 'Marca'),
                ),
                TextField(
                  controller: modeloController,
                  decoration: const InputDecoration(labelText: 'Modelo'),
                ),
                TextField(
                  controller: descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                ),
                TextField(
                  controller: anoModeloController,
                  decoration: const InputDecoration(labelText: 'Ano modelo'),
                ),
                TextField(
                  controller: anoFabricacaoController,
                  decoration:
                      const InputDecoration(labelText: 'Ano de Fabricação'),
                ),
                TextField(
                  controller: valorController,
                  decoration: const InputDecoration(labelText: 'Valor'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                String marca = marcaController.text;
                String modelo = modeloController.text;
                String descricao = descricaoController.text;
                String anoModelo = anoModeloController.text;
                String anoFabricacao = anoFabricacaoController.text;
                String valor = valorController.text;

                updateCarro.createCarro(
                  Car(
                    id: carro.id,
                    marca: marca,
                    modelo: modelo,
                    descricao: descricao,
                    anoModelo: DateTime.parse(anoModelo),
                    anoFabricacao: DateTime.parse(anoFabricacao),
                    valor: double.tryParse(valor),
                  ),
                );

                Navigator.of(context).pop(); // Fecha o modal
              },
              child: const Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o modal
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void showCarDetails(BuildContext context, Car carro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ID ${carro.id} - Detalhes do Carro - ${carro.modelo}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Marca: ${carro.marca}'),
                Text('Modelo: ${carro.modelo}'),
                Text('Descrição: ${carro.descricao}'),
                Text('Valor: R\$${carro.valor?.toStringAsFixed(2)}'),
                Text(
                    'Ano de Fabricação: ${carro.anoFabricacao?.year.toString()}'),
                Text('Ano do Modelo: ${carro.anoModelo?.year.toString()}'),
                // Inclua aqui mais detalhes se necessário
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
