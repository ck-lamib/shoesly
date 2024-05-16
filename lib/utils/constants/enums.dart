//store enums here

import 'package:flutter/material.dart';
import 'package:shoesly/utils/theme/colors.dart';

enum Brands {
  all(name: "All"),
  adidas(name: "Adidas"),
  jordan(name: "Jordan"),
  nike(name: "Nike"),
  puma(name: "Puma"),
  reebok(name: "Reebok"),
  vans(name: "Vans");

  final String name;
  const Brands({required this.name});
}

enum ProductColors {
  white(color: AppColors.whiteColor, text: "White"),
  black(color: AppColors.primaryColorDefault, text: "Black"),
  grey(color: AppColors.greyColor, text: "Grey"),
  blue(color: AppColors.infoDefault, text: "Blue");

  final Color color;
  final String text;
  const ProductColors({
    required this.color,
    required this.text,
  });
}
