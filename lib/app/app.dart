import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/screens/filter/bloc/filter_bloc.dart';
import 'package:shoesly/screens/product/bloc/product_bloc.dart';
import 'package:shoesly/screens/splash/cubit/splash_cubit.dart';
import 'package:shoesly/screens/splash/views/splash_screen.dart';
import 'package:shoesly/utils/routes/app_routes.dart';
import 'package:shoesly/utils/theme/theme_config.dart';

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(),
        ),
        BlocProvider<FilterBloc>(
          create: (context) => FilterBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(ProductFetched()),
        ),
      ],
      child: const ShoeslyAppView(),
    );
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
