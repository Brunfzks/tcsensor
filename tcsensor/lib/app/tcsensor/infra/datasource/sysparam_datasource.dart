import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/get_sysparam_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/save_sysparam_sqllite.dart';

abstract class SysParamDataSource {
  Future<SysParamModel> getSysParam(ParamsGetSysParam params);
  Future<bool> saveSysParam(ParamsSaveSysParam params);
}
