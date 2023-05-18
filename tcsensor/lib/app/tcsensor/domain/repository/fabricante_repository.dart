import 'package:dartz/dartz.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/get_fabricantes/get_fabricantes.dart';

abstract class FabricanteRepository {
  Future<Either<FabricanteException, FabricanteModel>> getFabricante(
      ParamsGetFabricantes params);
}
