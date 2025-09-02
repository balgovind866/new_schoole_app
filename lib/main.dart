import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schoole_app/routes/routes_page.dart';
import 'package:schoole_app/utils/them_controller.dart';
import 'package:schoole_app/utils/theme.dart';
import 'package:schoole_app/veiw/auth_page/schoole_verfication/schoole_code_cubit.dart';
import 'data/nocal_storage/user_secure_storage.dart';
import 'data/repositories/auth_api_repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Setup dependencies
  await Get.putAsync(() async => ThemeController());

  // Decide initial route
  final String initialRoute = await _getInitialRoute();

  runApp(MyApp(initialRoute: initialRoute));
}

Future<String> _getInitialRoute() async {
  final token = await UserSecureStorage.getToken();

  if (token != null && token.isNotEmpty) {
    print("🔐 Token found: $token");
    // You can route to onboarding, home, or dashboard here if needed
    return AppRoutes.splash;
  } else {
    print("🚫 No token found");
    return AppRoutes.splash;
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        final textTheme = Theme
            .of(context)
            .textTheme;
        final materialTheme = MaterialTheme(textTheme);

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => SchooleCodeCubit(AuthApiRepository()),
            ),
            // Add more cubits here
            // BlocProvider(create: (_) => AnotherCubit()),
          ],

          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'School App',
            theme: materialTheme.light(),
            darkTheme: materialTheme.dark(),
            initialRoute: initialRoute,
            getPages: AppRoutes.routes,

            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
