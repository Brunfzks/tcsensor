import 'package:sqflite/sqlite_api.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';

import 'package:tcsensor/app/tcsensor/infra/datasource/fabricante_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/get_fabricantes_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/save_fabricantes_sqllite.dart';

class FabricanteSqlLite extends FabricanteDataSource {
  Database database;
  FabricanteSqlLite({
    required this.database,
  });

  @override
  Future<bool> saveFabricantes(ParamsSaveFabricantes params) async {
    try {
      for (var fabricante in params.fabricante) {
        await database.transaction((txn) async {
          await txn.rawInsert('INSERT INTO fornecedores(id, nome) VALUES(?, ?)',
              [fabricante.codFabricante, fabricante.nome]);
          return true;
        });
      }

      throw FabricanteException(message: 'Erro não expecificado');
    } catch (e) {
      throw FabricanteException(message: e.toString());
    }
  }

  @override
  Future<List<FabricanteModel>> getFabricantes(
      ParamsGetFabricantes params) async {
    try {
      return await database
          .rawQuery('SELECT * FROM fornecedores')
          .then((value) {
        List<FabricanteModel> listFabricante = [];
        for (var map in value) {
          listFabricante.add(FabricanteModel.fromMap(map));
        }
        return listFabricante;
      });
    } catch (e) {
      throw FabricanteException(message: e.toString());
    }
  }
}
