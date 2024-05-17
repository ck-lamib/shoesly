import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';

Row getRatingCount({
  int maxRating = 5,
  required int userRating,
}) {
  return Row(
    children: List.generate(maxRating, (index) {
      // Check if it's one of the last stars to be colored
      final isLastStars = index >= userRating;

      // Define color based on whether it's one of the last stars
      final colorFilter = isLastStars
          ? const ColorFilter.mode(
              AppColors.primaryColorLightest,
              BlendMode.srcIn,
            )
          : null;

      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        child: SvgPicture.asset(
          AppAssetsRoutes.starPath,
          height: 12,
          width: 12,
          colorFilter: colorFilter,
        ),
      );
    }).toList(),
  );
}
