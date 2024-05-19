import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';

import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/screens/cart/views/cart_screen.dart';
import 'package:shoesly/screens/filter/views/filter_screen.dart';
import 'package:shoesly/screens/product/bloc/product_bloc.dart';
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
    // productService.fetchProducts();
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: SvgPicture.asset(
                          AppAssetsRoutes.cartPath,
                        ),
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
                  padding: const EdgeInsets.only(
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
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: appHorizontalPadding,
                    vertical: appHorizontalPadding / 2,
                  ),
                  child: TabBarView(
                    children: [
                      //all tabview
                      const AllDiscoverTabView(),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.adidasProducts],
                          );
                        },
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.jordanProducts],
                          );
                        },
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.nikeProducts],
                          );
                        },
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.pumaProducts],
                          );
                        },
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.reebokProducts],
                          );
                        },
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return DiscoverTabView(
                            productModelList: [...state.vansProducts],
                          );
                        },
                      ),
                    ],
                  ),
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

class DiscoverTabView extends StatelessWidget {
  const DiscoverTabView({
    super.key,
    required this.productModelList,
  });
  final ProductModelList productModelList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        childAspectRatio: 0.65,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      itemCount: productModelList.length,
      itemBuilder: (context, index) {
        return ProductListPotraitTile(
          productModel: productModelList[index],
        );
      },
    );
  }
}

class AllDiscoverTabView extends StatefulWidget {
  const AllDiscoverTabView({
    super.key,
  });

  @override
  State<AllDiscoverTabView> createState() => _AllDiscoverTabViewState();
}

class _AllDiscoverTabViewState extends State<AllDiscoverTabView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          BlocProvider.of<ProductBloc>(context).add(ProductFetched());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.productFetchedStatus == AppProgressStatus.success) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            itemCount: state.allProducts.length,
            // state.hasReachedMax
            //     ? state.allProducts.length
            //     : state.allProducts.length + 1,
            controller: _scrollController,
            itemBuilder: (context, index) {
              // print(state.allProducts[index].name);
              // if (index >= state.allProducts.length) {
              //   // Show a loading indicator
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              return ProductListPotraitTile(
                productModel: state.allProducts[index],
              );
            },
          );
        } else if (state.productFetchedStatus == AppProgressStatus.failure) {
          return Center(
            child: Text(state.productFetchedError),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
