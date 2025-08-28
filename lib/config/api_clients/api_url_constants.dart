class ApiConstants {
  // Base URLs for different environments
   //static const String devBaseUrl = 'http://localhost:5000/api';
  static const String devBaseUrl = 'https://schoole-erp-system-api.onrender.com/api';
  static const String stagingBaseUrl = 'https://staging-api.yourapp.com/api';
  static const String productionBaseUrl = 'http://192.168.33.76:3000/api';

  // Current environment - you can change this based on build configuration
  //static const String baseUrl = productionBaseUrl;
  static const String baseUrl =  productionBaseUrl ;
  // API Endpoints
  static const String login = '/users/login';
  static const String verifySchooleCode = '/schoole/info';
  static const String resendOtp = '/users/resend-otp';
  static const String register = '/users/register';
  static const String featured = '/slider';
  static const String courts = '$baseUrl/courts';
  static const String courtsDetails = '$baseUrl/courts/details';
  static const String sliderDetails = '$baseUrl/slider/details';
  static const String players = '$baseUrl/players';
  static const String createPlayers = '$baseUrl/admin/players';
  static const String createGame = '$baseUrl/games';
  static const String getGamesActive = '$baseUrl/game/active';
  static const String getGamesPast = '$baseUrl/game/past';
  static const String getNearGames = '$baseUrl/games';
}