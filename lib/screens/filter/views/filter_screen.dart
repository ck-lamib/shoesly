import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/product/cubit/product_image_carousel/product_image_carousel_cubit.dart';
import 'package:shoesly/screens/product/cubit/product_size_picker/product_size_picker_cubit.dart';
import 'package:shoesly/screens/product/widget/product_image_carousel.dart';
import 'package:shoesly/screens/product/widget/product_size_picker.dart';
import 'package:shoesly/screens/product/widget/review_tile.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/constants/enums.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';
import 'package:shoesly/widgets/widget_method.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filter-screen";
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductImageCarouselCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizePickerCubit(),
        ),
      ],
      child: const FilterView(),
    );
  }
}

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
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
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Brands.values.map(
                    (brand) {
                      if (brand.name == "All") return const SizedBox.shrink();
                      return GestureDetector(
                        onTap: () {
                          // BlocProvider.of<ProductImageCarouselCubit>(context)
                          //     .onColorSelected(color);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.primaryColorLightest,
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: SvgPicture.asset(
                                    brand.logoPath,
                                  ),
                                ),
                              ),
                              Text(
                                brand.name,
                              ),
                            ],
                          ),
                        ),
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
                    RangeSlider(
                      activeColor: AppColors.primaryColorDefault,
                      inactiveColor: AppColors.primaryColorLightest,
                      values: RangeValues(200, 750),
                      max: 1000,
                      divisions: 1000,
                      labels: RangeLabels("\$200", "\$750"),
                      onChanged: (RangeValues values) {
                        // setState(() {
                        //   _currentRangeValues = values;
                        // });
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        style: theme.textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "Price Range : ",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Color(0xFFAAAAAA),
                            ),
                          ),
                          TextSpan(
                            text: "\$235,00 - ",
                          ),
                          TextSpan(
                            text: "\$235,00",
                          ),
                        ],
                      ),
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
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Most Recent"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Lowest Price"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Highest Review"),
                    ),
                  ],
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
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Man"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Woman"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Unisex"),
                    ),
                  ],
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
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: OutlinedButton.icon(
                        onPressed: () {},
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
            offset: Offset(0, 0),
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
                child: Text("Reset (4)"),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
