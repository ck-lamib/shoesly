import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/filter/bloc/filter_bloc.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/constants/enums.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';

import '../../product/cubit/product_image_carousel/product_image_carousel_cubit.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filter-screen";
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FilterView();
  }
}

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Filter",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brands",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Brands.values.map(
                    (brand) {
                      if (brand.name == "All") return const SizedBox.shrink();
                      return BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<FilterBloc>(context).add(
                                FilterByBrandSelected(brand: brand),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 27,
                                        backgroundColor:
                                            AppColors.primaryColorLightest,
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: SvgPicture.asset(
                                            brand.logoPath,
                                          ),
                                        ),
                                      ),
                                      state.filteredBrands.contains(brand)
                                          ? const Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: CircleAvatar(
                                                radius: 8,
                                                backgroundColor: AppColors
                                                    .primaryColorDefault,
                                                child: Icon(
                                                  Icons.check,
                                                  size: 10,
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    brand.name,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  Text(
                                    "601 items",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.primaryColorLighter,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Price Range",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  BlocProvider.of<FilterBloc>(context).add(
                    //             FilterByBrandSelected(brand: brand),
                    //           );
                    BlocBuilder<FilterBloc, FilterState>(
                      builder: (context, state) {
                        return RangeSlider(
                          activeColor: AppColors.primaryColorDefault,
                          inactiveColor: AppColors.primaryColorLightest,
                          values: RangeValues(
                            state.filteredRangeStart.toDouble(),
                            state.filteredRangeEnd.toDouble(),
                          ),
                          max: 5000,
                          divisions: 5000,
                          labels: RangeLabels(
                            "\$${state.filteredRangeStart.round().toString()}",
                            "\$${state.filteredRangeEnd.round().toString()}",
                          ),
                          onChanged: (RangeValues values) {
                            BlocProvider.of<FilterBloc>(context).add(
                              FilterByPriceRangeSelected(
                                rangeStart: values.start.toInt(),
                                rangeEnd: values.end.toInt(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    BlocBuilder<FilterBloc, FilterState>(
                      builder: (context, state) {
                        return Text.rich(
                          TextSpan(
                            style: theme.textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: "Price Range : ",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFFAAAAAA),
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\$${state.filteredRangeStart.round().toString()} - ",
                              ),
                              TextSpan(
                                text:
                                    "\$${state.filteredRangeEnd.round().toString()}",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Sort By",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              // BlocBuilder<FilterBloc, FilterState>(
              //       builder: (context, state) {
              //         return ;
              //       },
              //     ),

              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: SortBy.values.map(
                    (sortBy) {
                      return BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          return state.filteredSortBy.contains(sortBy)
                              ? Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<FilterBloc>(context).add(
                                        FilterBySortBySelected(sortBy: sortBy),
                                      );
                                    },
                                    child: Text(sortBy.text),
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      BlocProvider.of<FilterBloc>(context).add(
                                        FilterBySortBySelected(sortBy: sortBy),
                                      );
                                    },
                                    child: Text(sortBy.text),
                                  ),
                                );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Gender",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Genders.values.map(
                    (gender) {
                      return BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          return state.filteredGenders.contains(gender)
                              ? Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<FilterBloc>(context).add(
                                        FilterByGendersSelected(gender: gender),
                                      );
                                    },
                                    child: Text(gender.text),
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      BlocProvider.of<FilterBloc>(context).add(
                                        FilterByGendersSelected(gender: gender),
                                      );
                                    },
                                    child: Text(gender.text),
                                  ),
                                );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Color",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ProductColors.values.map((color) {
                    return Container(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          return OutlinedButton.icon(
                            onPressed: () {
                              BlocProvider.of<FilterBloc>(context).add(
                                FilterByProductColorsSelected(
                                  productColor: color,
                                ),
                              );
                            },
                            style: state.filteredProductColors.contains(color)
                                ? OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: AppColors.primaryColorDefault,
                                    ),
                                  )
                                : null,
                            icon: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: color.color,
                                shape: BoxShape.circle,
                                border: color == ProductColors.white
                                    ? Border.all(color: AppColors.borderColor)
                                    : null,
                              ),
                            ),
                            label: Text(color.text),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 40,
        padding: EdgeInsets.symmetric(
          horizontal: appHorizontalPadding,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurStyle: BlurStyle.outer,
            blurRadius: 30,
            color: AppColors.shadowColor.withOpacity(0.5),
            spreadRadius: 0,
          ),
        ]),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("Reset (4)"),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
