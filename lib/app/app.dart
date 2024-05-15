import 'package:flutter/material.dart';
import 'package:shoesly/screens/splash/views/splash_screen.dart';
import 'package:shoesly/utils/routes/app_routes.dart';
import 'package:shoesly/utils/theme/theme_config.dart';

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ShoeslyAppView();
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class ShoeslyAppView extends StatelessWidget {
  const ShoeslyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shoesly App",
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.lightTheme,
    );
  }
}
