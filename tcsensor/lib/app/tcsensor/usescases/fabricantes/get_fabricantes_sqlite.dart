import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/entities/fabricante.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/fabricante_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/get_fabricantes_firebase.dart';

abstract class IGetFrabicantesSqllite {
  Future<Either<FabricanteException, List<Fabricante>>> call(
      ParamsGetFabricantes params);
}

class GetFrabicantesSqlLIte implements IGetFrabicantesSqllite {
  FabricanteRepository repository;
  GetFrabicantesSqlLIte({
    required this.repository,
  });

  @override
  Future<Either<FabricanteException, List<FabricanteModel>>> call(
      ParamsGetFabricantes params) async {
    return await repository.getFabricantes(params);
  }
}
