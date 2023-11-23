import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';

import '../../../injectable.dart';
import '../../../modules/pessoa/domain/repositories/pessoa_repository.dart';

class CriarPessoaStore extends Store<Pessoa> {
  final repository = injector.get<PessoaRepository>();
  final pessoaStore = injector.get<PessoaStore>();
  CriarPessoaStore() : super(Pessoa());

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
  }
}
