import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Credentials {
  final String email;
  final String password;
  Credentials({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'senha': password,
    };
  }

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      email: map['email'] as String,
      password: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Credentials.fromJson(String source) => Credentials.fromMap(json.decode(source) as Map<String, dynamic>);

  Credentials copyWith({
    String? email,
    String? password,
  }) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
