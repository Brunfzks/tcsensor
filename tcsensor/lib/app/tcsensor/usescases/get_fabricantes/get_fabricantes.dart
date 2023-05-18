import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/entities/fabricante.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/fabricante_repository.dart';

abstract class IGetFrabicantes {
  Future<Either<FabricanteException, Fabricante>> call(
      ParamsGetFabricantes params);
}

class GetFrabicantes implements IGetFrabicantes {
  FabricanteRepository repository;
  GetFrabicantes({
    required this.repository,
  });

  @override
  Future<Either<FabricanteException, Fabricante>> call(
      ParamsGetFabricantes params) async {
    return await repository.getFabricante(params);
  }
}

class ParamsGetFabricantes {}
