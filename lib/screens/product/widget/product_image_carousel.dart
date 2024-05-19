import 'package:shoesly/utils/constants/enums.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoesly/screens/product/cubit/product_image_carousel/product_image_carousel_cubit.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/widgets/custom_cached_netwoking.dart';

class ProductImageCarousel extends StatelessWidget {
  final List<String> images;
  final List<ProductColors> colors;
  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.colors,
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
                    children: images.isEmpty
                        ? [
                            const CustomCachedNetworkImage(imageUrl: ""),
                          ]
                        : images
                            .map(
                              (e) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: appHorizontalPadding / 2,
                                ),
                                child: CustomCachedNetworkImage(
                                  imageUrl: e,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                            .toList(),
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
                      dotsCount: images.isEmpty ? 1 : images.length,
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
              colors.isEmpty
                  ? const SizedBox.shrink()
                  : Positioned(
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
                              children: colors.map(
                                (e) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<
                                                  ProductImageCarouselCubit>(
                                              context)
                                          .onColorSelected(e);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: e.color,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: e == ProductColors.white
                                              ? AppColors.borderColor
                                              : Colors.transparent,
                                        ),
                                      ),
                                      child: state.productColors == e
                                          ? Icon(
                                              Icons.check,
                                              size: 12,
                                              weight: 5,
                                              color: e == ProductColors.white
                                                  ? AppColors.primaryColorDark
                                                  : AppColors.whiteColor,
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  );
                                },
                              ).toList(),
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


// ProductColors.values.map((color) {
//                           return GestureDetector(
//                             onTap: () {
//                               BlocProvider.of<ProductImageCarouselCubit>(
//                                       context)
//                                   .onColorSelected(color);
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(horizontal: 5),
//                               width: 20,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 color: color.color,
//                                 borderRadius: BorderRadius.circular(100),
//                                 border: Border.all(
//                                   color: color == ProductColors.white
//                                       ? AppColors.borderColor
//                                       : Colors.transparent,
//                                 ),
//                               ),
//                               child: state.productColors == color
//                                   ? Icon(
//                                       Icons.check,
//                                       size: 12,
//                                       weight: 5,
//                                       color: color == ProductColors.white
//                                           ? AppColors.primaryColorDark
//                                           : AppColors.whiteColor,
//                                     )
//                                   : const SizedBox.shrink(),
//                             ),
//                           );
//                         }).toList()