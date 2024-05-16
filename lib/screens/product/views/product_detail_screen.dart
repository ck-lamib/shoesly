import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/product/cubit/product_image_carousel/product_image_carousel_cubit.dart';
import 'package:shoesly/screens/product/cubit/product_size_picker/product_size_picker_cubit.dart';
import 'package:shoesly/screens/product/widget/product_image_carousel.dart';
import 'package:shoesly/screens/product/widget/product_size_picker.dart';
import 'package:shoesly/screens/product/widget/review_tile.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductImageCarouselCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizePickerCubit(),
        ),
      ],
      child: const ProductDetailView(),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          SvgPicture.asset(
            AppAssetsRoutes.cartPath,
          ),
        ],
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
              const ProductImageCarousel(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Jordan 1 Retro High Tie Dye",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  getRatingCount(
                    userRating: 3,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.5",
                    style: theme.textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(1045 Reviews)",
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
              const SizedBox(
                height: 50,
                child: ProductSizePicker(
                  sizes: [39, 39.5, 40, 40.5, 41],
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
                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColorLight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Review (1045)",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Row(
        children: [],
      ),
    );
  }
}
