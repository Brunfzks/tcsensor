import 'dart:convert';

import 'package:tcsensor/app/tcsensor/domain/entities/fabricante.dart';

class FabricanteModel implements Fabricante {
  @override
  final int codFabricante;

  @override
  final String nome;
  FabricanteModel({
    required this.codFabricante,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'codFabricante': codFabricante,
      'nome': nome,
    };
  }

  factory FabricanteModel.fromMap(Map<String, dynamic> map) {
    return FabricanteModel(
      codFabricante: map['codFabricante']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FabricanteModel.fromJson(String source) =>
      FabricanteModel.fromMap(json.decode(source));
}
