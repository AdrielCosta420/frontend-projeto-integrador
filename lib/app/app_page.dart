import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/app/users/stores/criar_pessoa_store.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/app/users/stores/user_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final pessoaStore = injector.get<PessoaStore>();
  final userStore = injector.get<UserStore>();
  final upPessoa = injector.get<CriarPessoaStore>();
  final carros = injector.get<CarrosStore>();
  @override
  void initState() {
    upPessoa.pessoaStore.getAllPessoas();
    userStore.getAllUser();
    pessoaStore.getAllPessoas();
    carros.getAllCar();
    Routefly.navigate(routePaths.login);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.blue.shade500,
          size: 70,
        ),
      ),
    );
  }
}
