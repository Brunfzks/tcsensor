import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/sysparam_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/datasource/sysparam_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/get_sysparam_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/sysparam/save_sysparam_sqllite.dart';

class SysParamRepositoryImpl implements SysParamRepository {
  SysParamDataSource datasource;

  SysParamRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<SysParamException, SysParamModel>> getSysParam(
      ParamsGetSysParam params) async {
    try {
      final sysparams = await datasource.getSysParam(params);
      return Right(sysparams);
    } on SysParamException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(
        SysParamException(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<SysParamException, bool>> saveSysParam(
      ParamsSaveSysParam params) async {
    try {
      final sysparams = await datasource.saveSysParam(params);
      return Right(sysparams);
    } on SysParamException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(
        SysParamException(
          message: e.toString(),
        ),
      );
    }
  }
}
