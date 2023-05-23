import 'package:sqflite/sqlite_api.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';

import 'package:tcsensor/app/tcsensor/infra/datasource/fabricante_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/get_fabricantes.dart';
import 'package:tcsensor/app/tcsensor/usescases/save_fabricantes.dart';

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
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
