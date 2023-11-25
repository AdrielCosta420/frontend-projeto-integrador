import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/injectable.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = injector.get();
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      onLoading: (context) => LoadingAnimationWidget.threeArchedCircle(
        color: Colors.blue.shade500,
        size: 70,
      ),
      onError: (context, error) => Text(error.toString()),
      store: store,
      onState: (context, state) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 26, bottom: 26, left: 170, right: 170),
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .75,
                decoration: BoxDecoration(
                  color: const Color(0xFF3e20dc),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: Image.asset('assets/images/lgac.png'),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      focusNode: FocusNode(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        letterSpacing: 0.1,
                      ),
                      controller: store.emailControler,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        alignLabelWithHint: true,
                        label: const Text(
                          'Email',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 13,
                          letterSpacing: 0.1,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      focusNode: FocusNode(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        letterSpacing: 0.1,
                      ),
                      cursorColor: Colors.white,
                      controller: store.passwordControler,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility),
                          splashRadius: 20,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        alignLabelWithHint: true,
                        label: const Text(
                          'Senha',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 13,
                          letterSpacing: 0.1,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String email = '';
                              String dataNascimento = '';

                              return AlertDialog(
                                title: const Text('Recuperar Senha'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Email'),
                                      onChanged: (value) => email = value,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Data de Nascimento'),
                                      onChanged: (value) =>
                                          dataNascimento = value,
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Aqui você faria a validação do email e data de nascimento
                                      // Se forem válidos, exiba a senha
                                      // Caso contrário, exiba uma mensagem de erro
                                      String senha =
                                          'senha'; // Substitua pela lógica de recuperar a senha

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Sua Senha'),
                                            content: Text(
                                                'Sua senha é: ${store.state.password}'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Recuperar'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: const Color.fromARGB(144, 0, 0, 0),
                          fixedSize: const Size(300, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () => store.login(),
                      child: const Text(
                        'CONTINUAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: 0.15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void exibirSenha(BuildContext context) {}
}
