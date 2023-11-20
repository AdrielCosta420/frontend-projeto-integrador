import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';
import 'entities/credentials.dart';
import 'repositories/auth_repository.dart';

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
        Routefly.navigate(routePaths.admin);
      },
    );
    setLoading(false);
  }
}
