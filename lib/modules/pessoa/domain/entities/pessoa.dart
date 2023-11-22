import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pessoa {
  final int? id;
  final String? nome;
  final String? email;
  final String? telefone;
  final DateTime? dataNasc;
  final DateTime? dataInclusao;
  final String? situacao;
  final String? perfil;
  final String? cpf;
  Pessoa({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.dataNasc,
    this.dataInclusao,
    this.situacao,
    this.perfil,
    this.cpf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'dataNasc': dataNasc?.millisecondsSinceEpoch,
      'dataInclusao': dataInclusao?.millisecondsSinceEpoch,
      'situacao': situacao,
      'perfil': perfil,
      'cpf': cpf,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as String : null,
      dataNasc: map['dataNasc'] != null
          ? DateTime.parse(map['dataNasc'] as String)
          : null,
      dataInclusao: map['dataInclusao'] != null
          ? DateTime.parse(map['dataInclusao'] as String)
          : null,
      situacao: map['situacao'] != null ? map['situacao'] as String : null,
      perfil: map['perfil'] != null ? map['perfil'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pessoa.fromJson(String source) =>
      Pessoa.fromMap(json.decode(source) as Map<String, dynamic>);
}
