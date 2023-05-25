import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/infra/datasource/sysparam_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/get_sysparam_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/save_sysparam_sqllite.dart';

class SysParamFireStore implements SysParamDataSource {
  FirebaseFirestore db;
  SysParamFireStore({
    required this.db,
  });

  @override
  Future<SysParamModel> getSysParam(ParamsGetSysParam params) async {
    try {
      QuerySnapshot query = await db.collection('Fabricantes').get();

      return SysParamModel.fromFireStore(query.docs[0]);
    } catch (e) {
      throw SysParamException(message: e.toString());
    }
  }

  @override
  Future<bool> saveSysParam(ParamsSaveSysParam params) {
    // TODO: implement saveSysParam
    throw UnimplementedError();
  }
}
