import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = "/discover-screen";
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DiscoverView();
  }
}

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appHorizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(top: appHorizontalPadding),
                  child: Row(
                    children: [
                      Text(
                        "Discover",
                        style: theme.textTheme.headlineLarge,
                      ),
                      SvgPicture.asset(
                        AppAssetsRoutes.cartPath,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
