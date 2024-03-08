class ApiResponse {
  final bool success;
  final Object? body;
  final dynamic error;

  const ApiResponse({
    required this.success,
    this.body,
    this.error,
  });
}
