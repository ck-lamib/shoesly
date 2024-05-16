import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/filter/views/filter_screen.dart';
import 'package:shoesly/screens/product/widget/product_list_potrait_tile.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/constants/enums.dart';
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
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(
                    top: appHorizontalPadding / 2,
                    left: appHorizontalPadding,
                    right: appHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                floating: true,
                snap: true,
                pinned: false,
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                flexibleSpace: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                    left: appHorizontalPadding,
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        child: Text(
                          Brands.all.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.adidas.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.jordan.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.nike.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.puma.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.reebok.name,
                        ),
                      ),
                      Tab(
                        child: Text(
                          Brands.vans.name,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appHorizontalPadding / 2,
                ),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    // mainAxisSpacing: 30,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListPotraitTile();
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          },
          icon: SvgPicture.asset(AppAssetsRoutes.filterPath),
          label: Text(
            "Filter".toUpperCase(),
          ),
        ),
      ),
    );
  }
}
