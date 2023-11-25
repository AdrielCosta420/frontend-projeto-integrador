import 'package:flutter/material.dart';
import 'package:projeto_integrador4/common/custom_menu.dart';

class ReservaCarroPage extends StatefulWidget {
  const ReservaCarroPage({super.key});

  @override
  State<ReservaCarroPage> createState() => _ReservaCarroPageState();
}

class _ReservaCarroPageState extends State<ReservaCarroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: CustomMenu(
          widget: Column(
        children: [Text('reserva de carro')],
      )),
    );
  }
}
