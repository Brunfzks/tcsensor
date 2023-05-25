import 'package:dartz/dartz.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/get_sysparam_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/save_sysparam_sqllite.dart';

abstract class SysParamRepository {
  Future<Either<SysParamException, SysParamModel>> getSysParam(
      ParamsGetSysParam params);
  Future<Either<SysParamException, bool>> saveSysParam(
      ParamsSaveSysParam params);
}
