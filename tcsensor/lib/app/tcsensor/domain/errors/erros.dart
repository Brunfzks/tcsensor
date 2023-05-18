class FabricanteException implements Exception {
  final String message;
  FabricanteException({
    required this.message,
  });

  @override
  String toString() => 'FabricanteException(message: $message)';
}
