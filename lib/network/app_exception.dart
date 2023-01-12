class AppException implements Exception {
  final String _message;
  final String _prefix;
  final int statusCode;

  AppException(this._message, this._prefix, this.statusCode);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message, int statusCode)
      : super(message, "Error During Communication: ", statusCode);
}

class BadRequestException extends AppException {
  BadRequestException(String message, int statusCode)
      : super(message, "Invalid Request: ", statusCode);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message, int statusCode)
      : super(message, "Unauthorised: ", statusCode);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message, int statusCode)
      : super(message, "Invalid Input: ", statusCode);
}

class ConflictException extends AppException {
  ConflictException(String message, int statusCode)
      : super(message, "Invalid Input: ", statusCode);
}

class NotFoundException extends AppException {
  NotFoundException(String message, int statusCode)
      : super(message, "Invalid Input: ", statusCode);
}
