
import 'dart:async';
import 'dart:io';

/// Base exception class for all API related exceptions
class AppException implements Exception {
  final String? message;
  final String prefix;
  final String? url;
  final int? statusCode;

  const AppException(this.message, this.prefix, [this.url, this.statusCode]);

  @override
  String toString() => "$prefix${message != null ? ': $message' : ''}";
}

class BadRequestException extends AppException {
  const BadRequestException([String? message, String? url])
      : super(message, 'Bad request', url);
}

class FetchDataException extends AppException {
  const FetchDataException([String? message, String? url])
      : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends AppException {
  const ApiNotRespondingException([String? message, String? url])
      : super(message, 'API not responding', url);
}

class UnAuthorizedException extends AppException {
  const UnAuthorizedException([String? message, String? url, int? statusCode])
      : super(message, 'Unauthorized request', url, statusCode);
}

class NotFoundException extends AppException {
  const NotFoundException([String? message, String? url])
      : super(message, 'Resource not found', url);
}

class NetworkException extends AppException {
  const NetworkException([String? message])
      : super(message, 'Network error');
}

/// Helper class to handle exceptions and convert them to user-friendly messages
class ExceptionHandlers {
  /// Converts various exception types to user-friendly string messages
  String getExceptionString(dynamic error) {
    // Log the error for debugging
    print('Exception occurred: ${error.toString()}');

    // Handle different exception types
    if (error is SocketException) {
      return 'No internet connection. Please check your network.';
    } else if (error is HttpException) {
      return 'HTTP error occurred. Please try again later.';
    } else if (error is FormatException) {
      return 'Invalid data format received from server.';
    } else if (error is TimeoutException) {
      return 'Request timed out. Please try again.';
    } else if (error is AppException) {
      // Return the message from our custom exceptions directly
      return error.toString();
    } else {
      return 'An unexpected error occurred. Please try again later.';
    }
  }

  /// Converts exceptions to AppException types
  AppException getAppException(dynamic error) {
    if (error is SocketException) {
      return const NetworkException('No internet connection');
    } else if (error is HttpException) {
      return const FetchDataException('HTTP error occurred');
    } else if (error is FormatException) {
      return const FetchDataException('Invalid data format');
    } else if (error is TimeoutException) {
      return const ApiNotRespondingException('Request timed out');
    } else if (error is AppException) {
      return error;
    } else {
      return const FetchDataException('Unexpected error');
    }
  }
}