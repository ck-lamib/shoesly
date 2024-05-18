import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/models/review_model.dart';
import 'package:shoesly/screens/product/cubit/product_image_carousel/product_image_carousel_cubit.dart';
import 'package:shoesly/screens/product/cubit/product_size_picker/product_size_picker_cubit.dart';
import 'package:shoesly/screens/product/widget/arguments/product_detail_screen_arg.dart';
import 'package:shoesly/screens/product/widget/product_image_carousel.dart';
import 'package:shoesly/screens/product/widget/product_size_picker.dart';
import 'package:shoesly/screens/review/views/review_screen.dart';
import 'package:shoesly/screens/review/widget/arguments/review_screen_arg.dart';
import 'package:shoesly/screens/review/widget/review_tile.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/helpers/logger.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';
import 'package:shoesly/widgets/widget_method.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail-screen";
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ProductDetailScreenArgument;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductImageCarouselCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizePickerCubit(),
        ),
      ],
      child: ProductDetailView(
        productModel: args.productModel,
      ),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailView({
    super.key,
    required this.productModel,
  });

  final TextEditingController quantityController =
      TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          SvgPicture.asset(
            AppAssetsRoutes.cartWithoutBadgePath,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: appHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageCarousel(
                colors: productModel.colors ?? [],
                images: productModel.images ?? [],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                productModel.name ?? "--:--",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  getRatingCount(
                    userRating: productModel.averageRating?.toInt() ?? 0,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel.averageRating == null
                        ? "--:--"
                        : productModel.averageRating.toString(),
                    style: theme.textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(${productModel.reviews?.length ?? 0} Reviews)",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.primaryColorLighter),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Size",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ProductSizePicker(
                  sizes: productModel.sizes ?? [],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productModel.description ?? "--:--",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColorLight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Review (${productModel.reviews?.length ?? 0})",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              ReviewView(
                reviews: productModel.reviews ??
                    [
                      Review(),
                      Review(),
                    ],
                averageRating: productModel.averageRating == null
                    ? "--:--"
                    : productModel.averageRating.toString(),
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
        padding: const EdgeInsets.symmetric(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColorLighter,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "\$",
                      style: theme.textTheme.headlineMedium,
                      children: const [
                        TextSpan(
                          text: "235,00",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  addedToCartBottomSheet(context);
                },
                child: const Text("Add to cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addedToCartBottomSheet(BuildContext context) {
    var theme = Theme.of(context);
    return showModalBottomSheet(
      backgroundColor: AppColors.whiteColor,
      barrierColor: AppColors.primaryColorDefault.withOpacity(0.3),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColorDefault,
                    width: 3,
                  ),
                  shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.check_rounded,
                  size: 50,
                  weight: 2,
                  color: AppColors.primaryColorLighter,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Added to cart",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "1 item Total",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Back Explore".toUpperCase(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "To cart".toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addToCartBottomSheet(BuildContext context) {
    var theme = Theme.of(context);
    return showModalBottomSheet(
      backgroundColor: AppColors.whiteColor,
      barrierColor: AppColors.primaryColorDefault.withOpacity(0.3),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 4,
                  width: 50,
                  // margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add to cart",
                    style: theme.textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Text(
                "Quantity",
                style: theme.textTheme.titleLarge,
              ),
              TextField(
                controller: quantityController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Product Quantity',
                    enabled: true,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            CustomLogger.trace("tap remove");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColorLighter,
                                ),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.primaryColorLighter,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            CustomLogger.trace("tap add");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColorDefault,
                                ),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.primaryColorDefault,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: kBottomNavigationBarHeight + 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Price",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryColorLighter,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "\$",
                              style: theme.textTheme.headlineMedium,
                              children: const [
                                TextSpan(
                                  text: "235,00",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add to cart"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewView extends StatelessWidget {
  final List<Review> reviews;
  final String averageRating;
  const ReviewView({
    super.key,
    required this.reviews,
    required this.averageRating,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return reviews.isEmpty
        ? Container(
            margin: const EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            child: Text(
              "No reviews available",
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColorLight,
              ),
            ),
          )
        : Column(
            children: [
              ...reviews.map((e) => ReviewTile(
                    review: e,
                  )),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ReviewScreen.routeName,
                    arguments: ReviewScreenArgument(
                      averageRating: averageRating,
                      reviews: reviews,
                    ),
                  );
                },
                child: Text(
                  "See all reviews".toUpperCase(),
                ),
              ),
            ],
          );
  }
}
