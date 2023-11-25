import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';
import '../../modules/auth/domain/entities/credentials.dart';
import '../../modules/auth/domain/repositories/auth_repository.dart';

class LoginStore extends Store<Credentials> {
  LoginStore() : super(Credentials(email: '', password: ''));

  final repository = injector.get<AuthRepository>();

  void changeEmail(String value) {
    update(state.copyWith(email: value));
  }

  void changePassword(String value) {
    update(state.copyWith(password: value));
  }

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  Future<void> login() async {
    setLoading(true);
    update(
      Credentials(
        email: emailControler.text,
        password: passwordControler.text,
      ),
    );

    final response = await repository.login(credentials: state);
    response.fold(
      (error) => setError(error.showMessage),
      (success) {
        if (success.perfil == 'ADMIN') {
          Routefly.navigate(routePaths.admin);
        } else {
          Routefly.navigate(routePaths.carros.allCarros);
        }
      },
    );
    setLoading(false);
  }
}
