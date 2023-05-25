import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/sysparam_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';

abstract class ISaveSysParamSqllite {
  Future<Either<SysParamException, bool>> call(ParamsSaveSysParam params);
}

class SaveSysParam implements ISaveSysParamSqllite {
  SysParamRepository repository;
  SaveSysParam({
    required this.repository,
  });

  @override
  Future<Either<SysParamException, bool>> call(
      ParamsSaveSysParam params) async {
    return await repository.saveSysParam(params);
  }
}

class ParamsSaveSysParam {
  SysParamModel sysParam;
  ParamsSaveSysParam({
    required this.sysParam,
  });
}
