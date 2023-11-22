import 'package:projeto_integrador4/core/api/api_request.dart';
import 'package:projeto_integrador4/core/constants/typedef.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/entities/pessoa.dart';
import 'package:projeto_integrador4/modules/pessoa/domain/errors/pessoa_errors.dart';
import 'package:projeto_integrador4/modules/pessoa/infra/datasource/pessoa_datasource.dart';

import '../../../../core/api/https_failure.dart';

class PessoaDatasourceImpl implements PessoaDatasource {
  final api = injector.get<ApiRequest>();

  @override
  Future<ApiResponse> createPessoa({required Pessoa pessoa}) async {
    try {
      return await api.post(url: 'criarPessoa', data: pessoa.toMap());
    } on HttpsFailure catch (e) {
      throw PessoaErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'PessoaDatasourceImpl',
        methodName: 'createPessoa',
      );
    } on Exception catch (e) {
      throw PessoaErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'PessoaDatasourceImpl',
        methodName: 'createPessoa',
      );
    }
  }

  @override
  Future<List<ApiResponse>> getAllPessoas() async {
    try {
      final response = await api.getList(url: 'pessoas');
      final listResponse = <ApiResponse>[];

      for (var element in response) {
        listResponse.add(element);
      }

      return listResponse;
    } on HttpsFailure catch (e) {
      throw PessoaErrors(
        messageError: e.messageError,
        showMessage: e.showMessage,
        fileName: 'PessoaDatasourceImpl',
        methodName: 'getAllPessoas',
      );
    } on Exception catch (e) {
      throw PessoaErrors(
        messageError: e.toString(),
        showMessage: e.toString(),
        fileName: 'PessoaDatasourceImpl',
        methodName: 'getAllPessoas',
      );
    }
  }
}
