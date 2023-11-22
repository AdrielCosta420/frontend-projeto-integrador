import 'package:projeto_integrador4/core/result/result_custom.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/errors/pessoa_errors.dart';

abstract interface class PessoaRepository {
  Future<Result<PessoaErrors, List<Pessoa>>> getAllPessoas();
  Future<Result<PessoaErrors, Pessoa>> createPessoa({required Pessoa pessoa});
}
