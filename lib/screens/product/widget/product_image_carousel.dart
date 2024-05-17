import 'package:shoesly/utils/constants/enums.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoesly/screens/product/cubit/product_image_carousel/product_image_carousel_cubit.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          height: height * 0.4,
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appBorderRadiusSize),
            color: AppColors.primaryColorLightest,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<ProductImageCarouselCubit, ProductImageCarouselState>(
                builder: (context, state) {
                  return PageView(
                    scrollDirection: Axis.horizontal,
                    onPageChanged:
                        BlocProvider.of<ProductImageCarouselCubit>(context)
                            .onImageSlided,
                    padEnds: true,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: appHorizontalPadding / 2,
                        ),
                        child: Image.asset(
                          AppAssetsRoutes.shoesPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: appHorizontalPadding / 2,
                        ),
                        child: Image.asset(
                          AppAssetsRoutes.shoesPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: BlocBuilder<ProductImageCarouselCubit,
                    ProductImageCarouselState>(
                  builder: (context, state) {
                    return DotsIndicator(
                      dotsCount: 3,
                      position: state.imageIndex,
                      decorator: DotsDecorator(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                        size: Size.square(height * 0.01),
                        spacing: const EdgeInsets.all(4),
                        color: AppColors.primaryColorLighter,
                        activeSize: Size.square(height * 0.01),
                        activeColor: AppColors.primaryColorDefault,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BlocBuilder<ProductImageCarouselCubit,
                      ProductImageCarouselState>(
                    builder: (context, state) {
                      return Row(
                        children: ProductColors.values.map((color) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<ProductImageCarouselCubit>(
                                      context)
                                  .onColorSelected(color);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: color.color,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: color == ProductColors.white
                                      ? AppColors.borderColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: state.productColors == color
                                  ? Icon(
                                      Icons.check,
                                      size: 12,
                                      weight: 5,
                                      color: color == ProductColors.white
                                          ? AppColors.primaryColorDark
                                          : AppColors.whiteColor,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
