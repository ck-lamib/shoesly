import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/product/views/product_detail_screen.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';

class ProductListPotraitTile extends StatelessWidget {
  const ProductListPotraitTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraint) {
              return Container(
                width: constraint.maxWidth,
                height: constraint.maxWidth,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(appBorderRadiusSize),
                  color: AppColors.primaryColorLightest,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        AppAssetsRoutes.adidasBrandPath,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColorLighter,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxWidth * 0.05,
                    ),
                    SizedBox(
                      width: constraint.maxWidth,
                      // width: 25,
                      child: Image.asset(
                        AppAssetsRoutes.shoesPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Jordan 1 Retro High Tie Dye laksd flasd",
            style: theme.textTheme.bodyMedium?.copyWith(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppAssetsRoutes.starPath,
                height: 12,
                width: 12,
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
            height: 5,
          ),
          Text.rich(
            TextSpan(
              text: "\$",
              style: theme.textTheme.titleLarge,
              children: const [
                TextSpan(
                  text: "235,00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
