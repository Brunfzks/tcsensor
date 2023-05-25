import 'package:dartz/dartz.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/get_fabricantes_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/save_fabricantes_sqllite.dart';

abstract class FabricanteRepository {
  Future<Either<FabricanteException, List<FabricanteModel>>> getFabricantes(
      ParamsGetFabricantes params);

  Future<Either<FabricanteException, bool>> saveFabricantes(
      ParamsSaveFabricantes params);
}
