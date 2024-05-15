import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/screens/discover/views/discover_screen.dart';
import 'package:shoesly/screens/splash/cubit/splash_cubit.dart';
import 'package:shoesly/utils/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: BlocListener<SplashCubit, bool>(
        listener: (context, state) {
          if (state == true) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              DiscoverScreen.routeName,
              (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Welcome to Shoesly",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const CircularProgressIndicator(
                color: AppColors.primaryColorDarkest,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
