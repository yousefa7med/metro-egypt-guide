abstract class AppException implements Exception {
  final String message;

  AppException({required this.message});
}

class TripDetailsException extends AppException {
  TripDetailsException({required super.message});
}
