import 'package:sqflite/sqflite.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/infra/datasource/sysparam_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/get_sysparam_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/save_sysparam_sqllite.dart';

class SysParamSqlLite implements SysParamDataSource {
  Database database;
  SysParamSqlLite({
    required this.database,
  });

  @override
  Future<SysParamModel> getSysParam(ParamsGetSysParam params) async {
    try {
      return await database.rawQuery('SELECT * FROM sysparam').then((value) {
        return SysParamModel.fromMap(value[0]);
      });
    } catch (e) {
      throw SysParamException(message: e.toString());
    }
  }

  @override
  Future<bool> saveSysParam(ParamsSaveSysParam params) async {
    try {
      await database.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO sysparam(kernel) VALUES(?)', [params.sysParam.kernel]);
        return true;
      });

      throw FabricanteException(message: 'Erro não expecificado');
    } catch (e) {
      throw FabricanteException(message: e.toString());
    }
  }
}
