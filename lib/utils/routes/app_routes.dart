import 'package:flutter/material.dart';
import 'package:shoesly/screens/discover/views/discover_screen.dart';
import 'package:shoesly/screens/product/views/product_detail_screen.dart';
import 'package:shoesly/screens/splash/views/splash_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Splash screen
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    //discover screen
    case DiscoverScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DiscoverScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    //discover- product-detail
    case ProductDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProductDetailScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    // //dashboard-routes
    // case DashboardScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const DashboardScreen(),
    //     settings: RouteSettings(
    //       name: settings.name,
    //       arguments: settings.arguments,
    //     ),
    //   );

    // //homescreen
    // case HomeScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const HomeScreen(),
    //     settings: RouteSettings(
    //       name: settings.name,
    //       arguments: settings.arguments,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              "",
              // AppLocalizations.of(_)!.appPageRouteNotFound(settings.name ?? ""),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
  }
}
