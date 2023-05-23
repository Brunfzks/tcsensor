part of 'get_fabricantes_cubit.dart';

enum FabricantesStatus { initial, completed, error, loading }

class FabricantesGetState extends Equatable {
  final List<FabricanteModel> fabricantes;
  final FabricantesStatus status;
  final String error;

  const FabricantesGetState({
    required this.fabricantes,
    required this.status,
    required this.error,
  });

  factory FabricantesGetState.initial() {
    return const FabricantesGetState(
        fabricantes: [], status: FabricantesStatus.initial, error: '');
  }

  FabricantesGetState copyWith({
    List<FabricanteModel>? fabricantes,
    FabricantesStatus? status,
    String? error,
  }) {
    return FabricantesGetState(
      fabricantes: fabricantes ?? this.fabricantes,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'FabricantesGetState(fabricantes: $fabricantes, status: $status, error: $error)';

  @override
  List<Object> get props => [fabricantes, status, error];
}
