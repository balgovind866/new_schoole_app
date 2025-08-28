import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/nocal_storage/user_secure_storage.dart';
import 'api_url_constants.dart';
import 'custom_network_exptions.dart';
class ApiClient {
  final String baseUrl;

  final Map<String, String> defaultHeaders;
  final Duration timeout;
    ApiClient({
    this.baseUrl = '${ApiConstants.baseUrl}',
    Map<String, String>? headers,
    this.timeout = const Duration(seconds: 120),
  }) : defaultHeaders = headers ?? {

    };

  Uri _buildUrl(String path) {
    if (path.startsWith('http')) {
      return Uri.parse(path);
    }
    return Uri.parse('$baseUrl$path');
  }

  Future<dynamic> get(
      String path, {
        Map<String, String>? headers,
        String contentType = 'application/json',
      }) async {
    final token = await UserSecureStorage.getToken(); // Get token securely

    try {
      final response = await http.get(
        _buildUrl(path),
        headers: {
          if (token != null) 'Authorization': 'Bearer $token', // Dynamic token
          'Content-Type': contentType,
          ...?headers, // Merge any additional headers passed
        },
      ).timeout(timeout);

      return _processResponse(response);
    } catch (e) {
      _logError('GET request failed', path, e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
  Future<dynamic> post(
      String path,
      dynamic body, {
        Map<String, String>? headers,
        String contentType = 'application/json',
      }) async {
    try {
      final response = await http
          .post(_buildUrl(path),
        headers: {
          'Content-Type': contentType,
          ...defaultHeaders,
          ...?headers,
        },
        body: jsonEncode(body),
      );

      return _processResponse(response);
    } catch (e) {
      _logError('POST request failed', path, e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<dynamic> post2(
      String path,
      dynamic body, {
        Map<String, String>? headers,
        String contentType = 'application/json',
      }) async {
    try {
      final token = await UserSecureStorage.getToken();
      final response = await http
          .post(_buildUrl(path),
        headers: {
          if (token != null) 'Authorization': 'Bearer $token', // Dynamic token
          'Content-Type': contentType,
          ...?headers, // Merge any additional headers passed
        },
        body: jsonEncode(body),
      );

      return _processResponse(response);
    } catch (e) {
      _logError('POST request failed', path, e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
  void _logError(String message, String path, dynamic error) {
    print('$message for path: $path');
    print('Error: $error');
  }

  dynamic _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;

    print('Response status: $statusCode, body: $responseBody');

    switch (statusCode) {
      case 200:
      case 201:
        return responseBody;
      case 400:
        throw BadRequestException(_getErrorMessage(responseBody));
      case 401:
        throw UnAuthorizedException(_getErrorMessage(responseBody), "", statusCode);
      case 403:
        throw UnAuthorizedException(_getErrorMessage(responseBody));
      case 404:
        throw NotFoundException(_getErrorMessage(responseBody));
      case 500:
      default:
        throw FetchDataException('Server error: $statusCode');
    }
  }

  String _getErrorMessage(String responseBody) {
    try {
      final decoded = jsonDecode(responseBody);
      return decoded['message'] ?? decoded['error'] ?? 'Unknown error';
    } catch (e) {
      return responseBody;
    }
  }
}
// try {
// // API call here
// } catch (e) {
// final errorHandler = ExceptionHandlers();
//
// // For displaying to users:
// final errorMessage = errorHandler.getExceptionString(e);
// showErrorDialog(errorMessage);
//
// // For logging or further handling:
// final appException = errorHandler.getAppException(e);
// logger.logError(appException);
//
// // Type-specific handling
// if (appException is UnAuthorizedException) {
// // Handle auth issues, maybe logout user
// }
// }