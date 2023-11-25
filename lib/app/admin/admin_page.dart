import 'package:flutter/material.dart';
import 'package:projeto_integrador4/common/custom_menu.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomMenu(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/lgac.png'),
          ),
          const Text(
            'PROJETO INTEGRADOR',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'ENGENHARIA DE SOFTWARE',
            style: TextStyle(fontSize: 30),
          ),
        ],
      )),
    );
  }
}
