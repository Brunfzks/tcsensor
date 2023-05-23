class FabricanteException implements Exception {
  final String message;
  FabricanteException({
    required this.message,
  });

  @override
  String toString() => 'FabricanteException(message: $message)';
}

class SqlLiteException implements Exception {
  final String message;
  SqlLiteException({
    required this.message,
  });

  @override
  String toString() => 'SqlLiteException(message: $message)';
}
