import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/app/users/stores/delete_pessoa_store.dart';
import 'stores/criar_pessoa_store.dart';
import 'stores/pessoa_store.dart';
import '../../common/custom_menu.dart';
import '../../injectable.dart';
import '../../modules/pessoa/domain/entities/pessoa.dart';
import '../../routes.dart';
import 'package:routefly/routefly.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final store = injector.get<PessoaStore>();
  final updatePessoa = injector.get<CriarPessoaStore>();
  final deletePessoa = injector.get<DeletePessoaStore>();

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
                    child: ScopedBuilder<PessoaStore, List<Pessoa>>(
                      store: store,
                      onLoading: (context) {
                        return LoadingAnimationWidget.threeArchedCircle(
                          color: Colors.blue.shade500,
                          size: 70,
                        );
                      },
                      onError: (context, error) => Text(error.toString()),
                      onState: (context, state) => ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: store.state.length,
                        itemBuilder: (context, index) {
                          final pessoa = store.state[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'ID',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            '${pessoa.id}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'NOME',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            '${pessoa.nome}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'EMAIL',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            '${pessoa.email}',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'TELEFONE',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            '${pessoa.telefone}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'DATA DE NASCIMENTO',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            pessoa.dataNasc
                                                .toString()
                                                .substring(0, 10),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'CPF',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Divider(),
                                          Text(
                                            '${pessoa.cpf}',
                                            //    textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      if (pessoa.perfil == 'CLIENTE')
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  editPessoa(context, pessoa),
                                              icon: Icon(
                                                Icons.edit,
                                                color: Colors.blue.shade300,
                                              ),
                                              tooltip: 'Editar',
                                            ),
                                            IconButton(
                                              onPressed: () => showDeletePessoa(
                                                  context, pessoa),
                                              icon: const Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                              ),
                                              tooltip: 'Deletar',
                                            ),
                                          ],
                                        )
                                      else
                                        const Row(
                                          children: [
                                            IconButton(
                                                onPressed: null,
                                                icon: Icon(null)),
                                            IconButton(
                                                onPressed: null,
                                                icon: Icon(
                                                  null,
                                                )),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        fixedSize: const Size(350, 45),
                        elevation: 5,
                      ),
                      onPressed: () =>
                          Routefly.navigate(routePaths.users.criarUsuario),
                      child: const Text('Adicionar novo usuário'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDeletePessoa(BuildContext context, Pessoa pessoa) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Tem certeza que deseja excluir ${pessoa.nome}?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                deletePessoa.deletePessoa(pessoa);

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

  void editPessoa(BuildContext context, Pessoa pessoa) {
    TextEditingController nomeController =
        TextEditingController(text: pessoa.nome);
    TextEditingController emailController =
        TextEditingController(text: pessoa.email);
    TextEditingController telefoneController =
        TextEditingController(text: pessoa.telefone);
    TextEditingController dataNascController =
        TextEditingController(text: pessoa.dataNasc.toString());
    TextEditingController cpfController =
        TextEditingController(text: pessoa.cpf);
    TextEditingController ativoController =
        TextEditingController(text: pessoa.perfil);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Pessoa'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                ),
                TextField(
                  controller: dataNascController,
                  decoration:
                      const InputDecoration(labelText: 'Data de Nascimento'),
                ),
                TextField(
                  controller: cpfController,
                  decoration: const InputDecoration(labelText: 'CPF'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                String nome = nomeController.text;
                String email = emailController.text;
                String telefone = telefoneController.text;
                String dataNasc = dataNascController.text;
                String cpf = cpfController.text;
                String ativo = ativoController.text;

                updatePessoa.updatePessoa(
                  Pessoa(
                    id: pessoa.id,
                    nome: nome,
                    email: email,
                    telefone: telefone,
                    dataNasc: DateTime.parse(dataNasc),
                    dataInclusao: DateTime.now(),
                    perfil: 'CLIENTE',
                    situacao: ativo,
                    cpf: cpf,
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
}
