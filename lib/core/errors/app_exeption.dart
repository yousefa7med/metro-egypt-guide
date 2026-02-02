abstract class AppException implements Exception {
  final String message;

  AppException({required this.message});
}

class TripDetailsException extends AppException {
  TripDetailsException({required super.message});
}

class LocationDisabledException implements Exception {}

class LocationPermissionDeniedException implements Exception {}

class LocationPermissionPermanentlyDeniedException implements Exception {}
