import 'package:dartz/dartz.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/sysparam_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/models/sysparam_model.dart';

abstract class IGetSysParamFirebase {
  Future<Either<SysParamException, SysParamModel>> call(
      ParamsGetSysParam params);
}

class GetSysParamFirebase implements IGetSysParamFirebase {
  SysParamRepository repository;
  GetSysParamFirebase({
    required this.repository,
  });

  @override
  Future<Either<SysParamException, SysParamModel>> call(
      ParamsGetSysParam params) async {
    return await repository.getSysParam(params);
  }
}

class ParamsGetSysParam {}
