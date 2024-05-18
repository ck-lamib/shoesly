//store enums here

import 'package:flutter/material.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';

enum AppProgressStatus { initial, loading, success, failure }

enum Brands {
  all(name: "All", logoPath: ""),
  adidas(name: "Adidas", logoPath: AppAssetsRoutes.adidasBrandPath),
  jordan(name: "Jordan", logoPath: AppAssetsRoutes.jordanBrandPath),
  nike(name: "Nike", logoPath: AppAssetsRoutes.nikeBrandPath),
  puma(name: "Puma", logoPath: AppAssetsRoutes.pumaBrandPath),
  reebok(name: "Reebok", logoPath: AppAssetsRoutes.reebokBrandPath),
  vans(name: "Vans", logoPath: AppAssetsRoutes.vansBrandPath);

  final String name;
  final String logoPath;
  const Brands({
    required this.name,
    required this.logoPath,
  });
}

enum ProductColors {
  black(color: AppColors.primaryColorDefault, text: "Black"),
  white(color: AppColors.whiteColor, text: "White"),
  red(color: AppColors.errorDefault, text: "Red"),
  grey(color: AppColors.greyColor, text: "Grey"),
  blue(color: AppColors.infoDefault, text: "Blue");

  final Color color;
  final String text;
  const ProductColors({
    required this.color,
    required this.text,
  });
}

enum SortBy {
  mostRecent(text: "Most Recent"),
  lowestPrice(text: "Lowest Price"),
  highestReview(text: "Highest Review");

  final String text;
  const SortBy({
    required this.text,
  });
}

enum Genders {
  man(text: "Man"),
  woman(text: "Woman"),
  unisex(text: "Unisex");

  final String text;
  const Genders({
    required this.text,
  });
}
