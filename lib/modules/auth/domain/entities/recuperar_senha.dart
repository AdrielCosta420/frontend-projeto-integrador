import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecuperarSenha {
  final String? login;
  final DateTime? dataNasc;
  RecuperarSenha({
    this.login,
    this.dataNasc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'dataNasc': dataNasc?.millisecondsSinceEpoch,
    };
  }

  factory RecuperarSenha.fromMap(Map<String, dynamic> map) {
    return RecuperarSenha(
      login: map['login'] != null ? map['login'] as String : null,
      dataNasc: map['dataNasc'] != null ? DateTime.parse(map['dataNasc'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecuperarSenha.fromJson(String source) => RecuperarSenha.fromMap(json.decode(source) as Map<String, dynamic>);
}
