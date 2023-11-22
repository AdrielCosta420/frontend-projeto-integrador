import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/common/custom_menu.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final store = injector.get<PessoaStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMenu(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Exibir os usuarios +/- aq'),
            Expanded(
              child: ScopedBuilder<PessoaStore, List<Pessoa>>(
                store: store,
                onState: (context, state) => ListView.builder(
                  itemCount: store.state.length,
                  itemBuilder: (context, index) {
                    final pessoa = store.state[index];
                    return Container(
                      height: 100,
                      width: 200,
                      margin: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${pessoa.nome}',
                                //     style: const TextStyle(fontSize: 25),
                              ),
                              Text('${pessoa.email}'),
                              Text('${pessoa.telefone}'),
                              Text('${pessoa.dataNasc}'),
                              Text('${pessoa.cpf}'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () =>
                    Routefly.navigate(routePaths.users.criarUsuario),
                child: const Text('Adicionar novo usuário'))
          ],
        ),
      ),
    );
  }
}
