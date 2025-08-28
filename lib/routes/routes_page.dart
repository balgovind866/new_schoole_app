import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schoole_app/veiw/splash_screean.dart';


// Import your screens/pages here



class AppRoutes {
  // Define route names as static constants for easy reference
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otpVerify='/otp';
  static const String onboarding = '/onboarding';
  static const String buttomBar='/buttomBar';
  static const String home = '/home';
  static const String feed = '/feed';
  static const String profile = '/profile';
  static const String createGame = '/create-game';
  static const String createQuickGame='/createQuickGame';
  static const String nearby = '/nearby';
  static const String groups = '/groups';

  // Define routes list with GetPage


  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    // Future GetPages go here
  ];

  // Helper method to navigate with named routes
  static void toSplash() => Get.toNamed(splash);
  static void toOtp(String email) => Get.toNamed(otpVerify, arguments: {'email': email});
  static void toLogin() => Get.toNamed(login);
  static void toSignup() => Get.toNamed(signup);
  static void toCreateQuickGame()=>Get.toNamed(createQuickGame);
  static void toOnboarding() => Get.offAllNamed(onboarding);
  static void toButtombar()=>Get.offAllNamed(buttomBar);

  static void toFeed() => Get.toNamed(feed);
  static void toProfile() => Get.toNamed(profile);
  static void toCreateGame() => Get.toNamed(createGame);
  static void toNearby() => Get.toNamed(nearby);
  static void toGroups() => Get.toNamed(groups);

  // Example of a route with parameter
  static void toProfileWithId(String userId) =>
      Get.toNamed('$profile/$userId');
}

// Example of a middleware (optional)
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Add your authentication logic here
    // For example, check if user is logged in
    // return RouteSettings(name: AppRoutes.login) if not authenticated
    return null;
  }
}