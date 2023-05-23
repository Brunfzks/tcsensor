import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/get_fabricantes.dart';
import 'package:tcsensor/app/tcsensor/usescases/save_fabricantes.dart';

abstract class FabricanteDataSource {
  Future<List<FabricanteModel>> getFabricantes(ParamsGetFabricantes params);
  Future<bool> saveFabricantes(ParamsSaveFabricantes params);
}
