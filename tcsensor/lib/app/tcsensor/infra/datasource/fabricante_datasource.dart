import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/get_fabricantes_firebase.dart';
import 'package:tcsensor/app/tcsensor/usescases/fabricantes/save_fabricantes_sqllite.dart';

abstract class FabricanteDataSource {
  Future<List<FabricanteModel>> getFabricantes(ParamsGetFabricantes params);
  Future<bool> saveFabricantes(ParamsSaveFabricantes params);
}
