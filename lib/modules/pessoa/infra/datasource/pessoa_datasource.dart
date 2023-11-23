import 'package:projeto_integrador4/core/constants/typedef.dart';

import '../../domain/entities/pessoa.dart';

abstract interface class PessoaDatasource {
  Future<List<ApiResponse>> getAllPessoas();
  Future<ApiResponse> createPessoa({required Pessoa pessoa});
  Future<ApiResponse> updatePessoa({required Pessoa pessoa});
  Future<ApiResponse> deletePessoa({required Pessoa pessoa});
}
