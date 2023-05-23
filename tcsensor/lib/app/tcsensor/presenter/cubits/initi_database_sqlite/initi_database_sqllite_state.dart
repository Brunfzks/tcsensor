part of 'initi_database_sqllite_cubit.dart';

enum SqlStatus { initial, completed, error, loading }

class InitiDataBaseState extends Equatable {
  final Database? database;
  final SqlStatus status;

  final String error;
  const InitiDataBaseState({
    this.database,
    required this.status,
    required this.error,
  });

  factory InitiDataBaseState.initial() {
    return const InitiDataBaseState(status: SqlStatus.initial, error: '');
  }

  InitiDataBaseState copyWith({
    Database? database,
    SqlStatus? status,
    String? error,
  }) {
    return InitiDataBaseState(
      database: database ?? this.database,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'InitiDataBase(database: $database, status: $status, error: $error)';

  @override
  List<Object> get props => [database!, status, error];
}
