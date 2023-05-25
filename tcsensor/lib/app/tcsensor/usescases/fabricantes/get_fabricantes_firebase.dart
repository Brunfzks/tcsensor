import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/entities/fabricante.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/fabricante_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';

abstract class IGetFrabicantes {
  Future<Either<FabricanteException, List<Fabricante>>> call(
      ParamsGetFabricantes params);
}

class GetFrabicantes implements IGetFrabicantes {
  FabricanteRepository repository;
  GetFrabicantes({
    required this.repository,
  });

  @override
  Future<Either<FabricanteException, List<FabricanteModel>>> call(
      ParamsGetFabricantes params) async {
    return await repository.getFabricantes(params);
  }
}

class ParamsGetFabricantes {}
