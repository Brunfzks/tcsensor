import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcsensor/app/tcsensor/domain/entities/fabricante.dart';

class FabricanteModel implements Fabricante {
  @override
  final String codFabricante;

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
      codFabricante: map['codFabricante'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FabricanteModel.fromJson(String source) =>
      FabricanteModel.fromMap(json.decode(source));

  factory FabricanteModel.fromFireStore(QueryDocumentSnapshot<Object?> doc) {
    return FabricanteModel(codFabricante: doc.id, nome: doc.get('nome'));
  }
}
