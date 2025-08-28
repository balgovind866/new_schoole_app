import 'dart:convert';



import '../../config/api_clients/api_client.dart';
import '../../config/api_clients/api_url_constants.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';
import '../model/registor_model.dart';
import '../model/schoole_code.dart';

class AuthApiRepository {
  final ApiClient _apiClient;

  AuthApiRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  Future<LoginModel> login(Map<String, dynamic> credentials) async {
    try {
      final response = await _apiClient.post(ApiConstants.login, credentials);
      return LoginModel.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }

  Future<SchooleCodeVerifation> verifySchooleCode(String schoolCode) async {
    try {


      final response = await _apiClient.get('${ApiConstants.verifySchooleCode}/${schoolCode}',);
      return SchooleCodeVerifation.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpModel> resendOtp(String userId) async {
    try {
      final Map<String, dynamic> payload = {
        'userId': userId,
      };

      final response = await _apiClient.post(ApiConstants.resendOtp, payload);
      return OtpModel.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }

  Future<RegistorModel> registorRepo(dynamic payload) async {
    try {
      final response = await _apiClient.post(ApiConstants.register, payload);
      return RegistorModel.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }
}