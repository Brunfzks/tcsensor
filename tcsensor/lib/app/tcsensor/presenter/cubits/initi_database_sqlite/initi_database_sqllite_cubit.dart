import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:equatable/equatable.dart';

part 'initi_database_sqllite_state.dart';

class InitiDatabaseSqlliteCubit extends Cubit<InitiDataBaseState> {
  InitiDatabaseSqlliteCubit() : super(InitiDataBaseState.initial());
}
