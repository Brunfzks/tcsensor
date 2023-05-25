import 'package:dartz/dartz.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/domain/repository/fabricante_repository.dart';
import 'package:tcsensor/app/tcsensor/infra/datasource/fabricante_datasource.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/get_fabricantes_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/save_fabricantes_sqllite.dart';

class FabricanteRepositoryImpl implements FabricanteRepository {
  final FabricanteDataSource datasource;
  FabricanteRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<FabricanteException, List<FabricanteModel>>> getFabricantes(
      ParamsGetFabricantes params) async {
    try {
      final fabricantes = await datasource.getFabricantes(params);
      return Right(fabricantes);
    } on FabricanteException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(
        FabricanteException(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FabricanteException, bool>> saveFabricantes(
      ParamsSaveFabricantes params) async {
    try {
      final fabricantes = await datasource.saveFabricantes(params);
      return Right(fabricantes);
    } on FabricanteException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(
        FabricanteException(
          message: e.toString(),
        ),
      );
    }
  }
}
