import 'package:flutter/material.dart';
import 'package:projeto_integrador4/common/custom_menu.dart';

class ReservarCarroPage extends StatefulWidget {
  const ReservarCarroPage({super.key});

  @override
  State<ReservarCarroPage> createState() => _ReservarCarroPageState();
}

class _ReservarCarroPageState extends State<ReservarCarroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomMenu(
            widget: Column(
      children: [
        Text('RESERVA DE CARROS'),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent),
        )
      ],
    )));
  }
}
