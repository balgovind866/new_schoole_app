import 'dart:convert';

import 'package:http/http.dart' as _apiClient;


import '../../config/api_clients/api_client.dart';
import '../../config/api_clients/api_url_constants.dart';
import '../model/all_feature_courtss.dart';
import '../model/create_games_section_model.dart';
import '../model/feature_slider_details.dart';
import '../model/featured_courts_models.dart';
import '../model/featured_slider.dart';
import '../model/players_models.dart';

class ApiRepository {
  static Future<FeaturedSlider> getFeaturedSlider() async {
    try {
      final response = await ApiClient().get(ApiConstants.featured);
      return FeaturedSlider.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }







}