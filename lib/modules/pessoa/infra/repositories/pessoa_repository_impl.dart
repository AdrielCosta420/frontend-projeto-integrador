import '../../../../core/result/result_custom.dart';
import '../../../../injectable.dart';
import '../../domain/entities/pessoa.dart';
import '../../domain/errors/pessoa_errors.dart';
import '../../domain/repositories/pessoa_repository.dart';
import '../datasource/pessoa_datasource.dart';

class PessoaRepositoryImpl implements PessoaRepository {
  final datasource = injector.get<PessoaDatasource>();

  @override
  Future<Result<PessoaErrors, Pessoa>> createPessoa({required Pessoa pessoa}) async {
     try {
      final response = await datasource.createPessoa(pessoa: pessoa);

      return Result.success(Pessoa.fromMap(response));
    } on PessoaErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        PessoaErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'PessoaRepositoryImpl',
          methodName: 'createPessoa',
        ),
      );
    }
  }

  @override
  Future<Result<PessoaErrors, List<Pessoa>>> getAllPessoas() async {
    try {
      final response = await datasource.getAllPessoas();
      final pessoaList = <Pessoa>[];

      for (var element in response) {
        pessoaList.add(Pessoa.fromMap(element));
      }
      return Result.success(pessoaList);
    } on PessoaErrors catch (e) {
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(
        PessoaErrors(
          messageError: e.toString(),
          showMessage: e.toString(),
          fileName: 'PessoaRepositoryImpl',
          methodName: 'getAllPessoas',
        ),
      );
    }
  }
}
