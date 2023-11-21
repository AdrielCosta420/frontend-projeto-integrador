import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final int? id;
  final String? login;
  final String? password;
  final bool? active;
  final DateTime? dateNasc;
  final DateTime? dateCad;
  UserData({
    this.id,
    this.login,
    this.password,
    this.active,
     this.dateNasc,
     this.dateCad,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'senha': password,
      'ativo': active,
      'dataNascimento': dateNasc,
      'dataCadastro': dateCad,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'] as int : null,
      login: map['login'] != null ? map['login'] as String : null,
      password: map['senha'] != null ? map['senha'] as String : null,
      active: map['ativo'] != null ? map['ativo'] as bool : null,
      dateNasc: DateTime.parse(map['dataNascimento'] as String),
      dateCad: DateTime.parse(map['dataCadastro'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}
