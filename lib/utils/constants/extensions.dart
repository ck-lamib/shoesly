//store enxtensions

import 'package:intl/intl.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/constants/enums.dart';

extension StringExtension on String {
  String get parseTimeAgo {
    try {
      final formatter = DateFormat('yyyy-MM-dd');
      final date = formatter.parse(toString());
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        return 'Today';
      } else if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks week${weeks > 1 ? 's' : ''} ago';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '$months month${months > 1 ? 's' : ''} ago';
      } else {
        final years = (difference.inDays / 365).floor();
        return '$years year${years > 1 ? 's' : ''} ago';
      }
    } catch (e) {
      return "";
    }
  }
}

extension BrandFilter on List<ProductModel> {
  List<ProductModel> filterByBrand(Brands? brand) {
    if (brand == null || brand == Brands.all) {
      return this;
    }
    return where((product) => product.brand == brand).toList();
  }
}

ProductColors? parseProductColors(String colorText) {
  switch (colorText.toLowerCase()) {
    case 'black':
      return ProductColors.black;
    case 'white':
      return ProductColors.white;
    case 'red':
      return ProductColors.red;
    case 'grey':
      return ProductColors.grey;
    case 'blue':
      return ProductColors.blue;
    default:
      return null;
  }
}
