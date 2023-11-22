import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/repositories/pessoa_repository.dart';

class PessoaStore extends Store<List<Pessoa>> {
  final repository = injector.get<PessoaRepository>();
  PessoaStore() : super([]) {
    getAllPessoas();
  }

  Future<void> getAllPessoas() async {
    setLoading(true);
    final response = await repository.getAllPessoas();

    response.fold(
      (error) => error.messageError,
      (success) => update(success),
    );
    setLoading(false);
  }

  Future<void> createPessoa(Pessoa pessoa) async {
    setLoading(true);

    final response = await repository.createPessoa(pessoa: pessoa);

    response.fold(
      (error) => error.messageError,
      (success) => (success),
    );
  }
}
