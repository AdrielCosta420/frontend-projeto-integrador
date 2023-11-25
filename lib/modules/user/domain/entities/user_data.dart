import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final int? id;
  final String? login;
  final String? password;
  final String? nome;
  final bool? active;
  final DateTime? dateNasc;
  final DateTime? dateCad;
  final bool? isAdmin;
  UserData({
    this.id,
    this.login,
    this.password,
    this.nome,
    this.active,
    this.dateNasc,
    this.dateCad,
    this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'senha': password,
      'nome': nome,
      'ativo': active,
      'dataNascimento': dateNasc,
      'dataCadastro': dateCad,
      'isAdmin': isAdmin,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'] as int : null,
      login: map['login'] != null ? map['login'] as String : null,
      password: map['senha'] != null ? map['senha'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      active: map['ativo'] != null ? map['ativo'] as bool : null,
      dateNasc: map['dataNascimento'] != null ? DateTime.parse(map['dataNascimento'] as String) : null,
      dateCad: map['dataCadastro'] != null ? DateTime.parse(map['dataCadastro'] as String) : null,
      isAdmin:map['admin'] != null ? map['admin']as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}
