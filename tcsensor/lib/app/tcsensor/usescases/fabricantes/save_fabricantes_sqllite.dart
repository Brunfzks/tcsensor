import 'package:dartz/dartz.dart';

import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/fabricante_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';

abstract class ISaveFrabicantes {
  Future<Either<FabricanteException, bool>> call(ParamsSaveFabricantes params);
}

class SaveFrabicantes implements ISaveFrabicantes {
  FabricanteRepository repository;
  SaveFrabicantes({
    required this.repository,
  });

  @override
  Future<Either<FabricanteException, bool>> call(
      ParamsSaveFabricantes params) async {
    return await repository.saveFabricantes(params);
  }
}

class ParamsSaveFabricantes {
  List<FabricanteModel> fabricante;
  ParamsSaveFabricantes({
    required this.fabricante,
  });
}
