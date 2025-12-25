class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;

  /// Check if the exception is due to network issues
  bool get isNetworkError =>
      message.contains('Failed host lookup') ||
      message.contains('SocketException');

  /// Check if the exception is due to timeout
  bool get isTimeoutError => message.contains('TimeoutException');

  /// Check if the exception is due to unauthorized access
  bool get isUnauthorized => statusCode == 401;

  /// Check if the exception is due to not found
  bool get isNotFound => statusCode == 404;

  /// Check if the exception is due to server error
  bool get isServerError => statusCode != null && statusCode! >= 500;

  /// Check if the exception is due to client error
  bool get isClientError =>
      statusCode != null && statusCode! >= 400 && statusCode! < 500;

  /// Check if the exception is due to unknown error
  bool get isUnknownError => statusCode == null;

  /// Get a user-friendly error message
  String get userFriendlyMessage {
    if (isNetworkError) {
      return 'Network error. Please check your internet connection.';
    } else if (isTimeoutError) {
      return 'Request timed out. Please try again later.';
    } else if (isUnauthorized) {
      return 'Unauthorized access. Please log in again.';
    } else if (isNotFound) {
      return 'Requested resource not found.';
    } else if (isServerError) {
      return 'Server error. Please try again later.';
    } else if (isClientError) {
      return 'Client error occurred. Please check your request.';
    } else {
      return 'An unknown error occurred. Please try again.';
    }
  }
}
