import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Car {
  final int? id;
  final String? marca;
  final String? modelo;
  final DateTime? anoFabricacao;
  final DateTime? anoModelo;
  final double? valor;
  final String? descricao;
  final bool? carroInteresse;
  Car({
    this.id,
    this.marca,
    this.modelo,
    this.anoFabricacao,
    this.anoModelo,
    this.valor,
    this.descricao,
    this.carroInteresse,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'anoFabricacao': anoFabricacao?.millisecondsSinceEpoch,
      'anoModelo': anoModelo?.millisecondsSinceEpoch,
      'valor': valor,
      'descricao': descricao,
      'carroInteresse': carroInteresse,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] != null ? map['id'] as int : null,
      marca: map['marca'] != null ? map['marca'] as String : null,
      modelo: map['modelo'] != null ? map['modelo'] as String : null,
      anoFabricacao: map['anoFabricacao'] != null
          ? DateTime.parse(map['anoFabricacao'] as String)
          : null,
      anoModelo: map['anoModelo'] != null
          ? DateTime.parse(map['anoModelo'] as String)
          : null,
      valor: map['valor'] != null ? map['valor'] as double : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      carroInteresse:
          map['carroInteresse'] != null ? map['carroInteresse'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);
}
