import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'package:tcsensor/app/tcsensor/external/firebase/fabricante_firestore_impl.dart';
import 'package:tcsensor/app/tcsensor/external/firebase/fabricante_sqllite_impl.dart';
import 'package:tcsensor/app/tcsensor/infra/models/fabricante_model.dart';
import 'package:equatable/equatable.dart';
import 'package:tcsensor/app/tcsensor/infra/repositories/fabricante_repository_impl.dart';
import 'package:tcsensor/app/tcsensor/usescases/get_fabricantes.dart';
import 'package:tcsensor/app/tcsensor/usescases/save_fabricantes.dart';

part 'get_fabricantes_state.dart';

class GetFabricantesCubit extends Cubit<FabricantesGetState> {
  GetFabricantesCubit() : super(FabricantesGetState.initial());

  KiwiContainer container = KiwiContainer();

  void getFabricantes() async {
    emit(state.copyWith(status: FabricantesStatus.loading));
    final result = await GetFrabicantes(
            repository: FabricanteRepositoryImpl(
                datasource:
                    FabricanteFireStore(db: FirebaseFirestore.instance)))
        .call(ParamsGetFabricantes());

    result.fold(
        (FabricanteException exception) => {
              emit(
                state.copyWith(
                  status: FabricantesStatus.error,
                  error: exception.message,
                ),
              ),
            },
        (List<FabricanteModel> fabricantes) => {
              emit(
                state.copyWith(
                  fabricantes: fabricantes,
                  status: FabricantesStatus.completed,
                ),
              ),
            });
  }

  void saveFabricantesSqlLite() async {
    emit(state.copyWith(status: FabricantesStatus.loading));
    final result = await SaveFrabicantes(
            repository: FabricanteRepositoryImpl(
                datasource:
                    FabricanteSqlLite(database: container.resolve<Database>())))
        .call(ParamsSaveFabricantes(fabricante: state.fabricantes));

    result.fold(
        (FabricanteException exception) => {
              emit(
                state.copyWith(
                  status: FabricantesStatus.error,
                  error: exception.message,
                ),
              ),
            },
        (bool flag) => {
              emit(
                state.copyWith(
                  status: FabricantesStatus.completed,
                ),
              ),
            });
  }
}
