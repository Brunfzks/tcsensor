import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcsensor/app/tcsensor/domain/entities/sysparam.dart';

class SysParamModel implements SysParam {
  @override
  final String kernel;
  SysParamModel({
    required this.kernel,
  });

  Map<String, dynamic> toMap() {
    return {
      'kernel': kernel,
    };
  }

  factory SysParamModel.fromMap(Map<String, dynamic> map) {
    return SysParamModel(
      kernel: map['kernel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SysParamModel.fromJson(String source) =>
      SysParamModel.fromMap(json.decode(source));

  factory SysParamModel.fromFireStore(QueryDocumentSnapshot<Object?> doc) {
    return SysParamModel(kernel: doc.get('kernel'));
  }
}
