import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';

import '../../../injectable.dart';
import '../../../modules/pessoa/domain/repositories/pessoa_repository.dart';

class DeletePessoaStore extends Store<String> {
  final repository = injector.get<PessoaRepository>();
  final pessoaStore = injector.get<PessoaStore>();
  DeletePessoaStore() : super('');

  Future<void> deletePessoa(Pessoa pessoa) async {
    setLoading(true);

    final response = await repository.deletePessoa(pessoa: pessoa);

    response.fold(
      (error) => error.messageError,
      (success) {
        update(success);
        SnackBar(
          content: Text(
            success.toString(),
          ),
        );
        pessoaStore.getAllPessoas();
      },
    );
  }
}
