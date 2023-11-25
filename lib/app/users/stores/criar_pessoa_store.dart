import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';

import '../../../injectable.dart';
import '../../../modules/pessoa/domain/repositories/pessoa_repository.dart';

class CriarPessoaStore extends Store<Pessoa> {
  final repository = injector.get<PessoaRepository>();
  final pessoaStore = injector.get<PessoaStore>();
  CriarPessoaStore()
      : super(
          Pessoa(
            ativo: false,
            cpf: '',
            dataInclusao: DateTime(0),
            dataNasc: DateTime(0),
            email: '',
            isAdmin: false,
            login: '',
            nome: '',
            perfil: '',
            senha: '',
            situacao: '',
            telefone: '',
          ),
        );

  void changeAtivo(bool value) {
    update(state.copyWith(ativo: value));
  }

  void changeCpf(String value) {
    update(state.copyWith(cpf: value));
  }

  void changDataInclusao(DateTime value) {
    update(state.copyWith(dataInclusao: value));
  }

  void changeDataNasc(DateTime value) {
    update(state.copyWith(dataNasc: value));
  }

  void changeEmail(String value) {
    update(state.copyWith(email: value));
  }

  void changeIsAdmin(bool value) {
    update(state.copyWith(isAdmin: value));
  }

  void changeLogin(String value) {
    update(state.copyWith(login: value));
  }

  void changeNome(String value) {
    update(state.copyWith(nome: value));
  }

  void changePerfil(String value) {
    update(state.copyWith(perfil: value));
  }

  void changeSenha(String value) {
    update(state.copyWith(senha: value));
  }

  void changesituacao(String value) {
    update(state.copyWith(situacao: value));
  }

  void changeTelefone(String value) {
    update(state.copyWith(telefone: value));
  }

  Future<void> createPessoa(Pessoa pessoa) async {
    setLoading(true);

    final response = await repository.createPessoa(pessoa: pessoa);

    response.fold(
      (error) => error.messageError,
      (success) {
        update(success);
        pessoaStore.getAllPessoas();
      },
    );
    setLoading(false);
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    setLoading(true);

    final response = await repository.updatePessoa(pessoa: pessoa);

    response.fold(
      (error) => error.messageError,
      (success) {
        update(success);
        pessoaStore.getAllPessoas();
      },
    );
    setLoading(false);
  }
}
