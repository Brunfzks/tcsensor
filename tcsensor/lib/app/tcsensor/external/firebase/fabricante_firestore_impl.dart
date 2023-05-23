import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';

import 'package:tcsensor/app/tcsensor/infra/datasource/fabricante_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/get_fabricantes.dart';

class FabricanteFireStore implements FabricanteDataSource {
  FirebaseFirestore db;
  FabricanteFireStore({
    required this.db,
  });

  @override
  Future<List<FabricanteModel>> getFabricantes(
      ParamsGetFabricantes params) async {
    try {
      QuerySnapshot query = await db.collection('Fabricantes').get();
      List<FabricanteModel> fabricantes = [];

      for (var doc in query.docs) {
        fabricantes.add(FabricanteModel.fromFireStore(doc));
      }
      return fabricantes;
    } catch (e) {
      throw FabricanteException(message: e.toString());
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
