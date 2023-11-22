import 'package:flutter/material.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';

import '../../common/custom_menu.dart';
import '../../common/custom_text_field.dart';

class CriarUsuarioPage extends StatefulWidget {
  const CriarUsuarioPage({super.key});

  @override
  State<CriarUsuarioPage> createState() => _CriarUsuarioPageState();
}

class _CriarUsuarioPageState extends State<CriarUsuarioPage> {
  final store = injector.get<PessoaStore>();
  final formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController ativoController = TextEditingController();
  TextEditingController dataNascController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomMenu(
      widget: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
            color: Colors.indigo[50],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CADASTRAR NOVO CLIENTE',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
                CustomTextFormField(
                    textController: nomeController,
                    label: 'Nome',
                    icon: Icons.account_circle_outlined),
                CustomTextFormField(
                  textController: emailController,
                  label: 'E-mail',
                  icon: Icons.email_outlined,
                ),
                CustomTextFormField(
                  textController: telefoneController,
                  label: 'Telefone',
                  icon: Icons.smartphone_rounded,
                ),
                CustomTextFormField(
                  textController: dataNascController,
                  label: 'Data de Nascimento',
                  icon: Icons.date_range_outlined,
                ),
                // CustomTextFormField(
                //     textController: dataCadController, label: 'Data de Cadastro'),
                CustomTextFormField(
                  textController: cpfController,
                  label: 'CPF',
                  icon: Icons.medical_information_outlined,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Routefly.navigate(routePaths.users.user),
                      child: const Text('Voltar'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3e20dc),
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          store.repository.createPessoa(
                              pessoa: Pessoa(
                            nome: nomeController.text,
                            email: emailController.text,
                            telefone: telefoneController.text,
                            dataNasc: DateTime.parse(dataNascController.text),
                            cpf: cpfController.text,
                            dataInclusao: DateTime.now(),
                            situacao: 'ATIVO',
                            perfil: 'CLIENTE',
                          ));
                          Routefly.navigate(routePaths.users.user);
                        }
                      },
                      child: const Text(
                        'Criar novo usuário',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
