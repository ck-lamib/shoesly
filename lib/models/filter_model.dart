import 'package:shoesly/utils/constants/enums.dart';

class ProductFilter {
  final List<Brands>? brands;
  final int? priceRangeStart;
  final int? priceRangeEnd;
  final List<SortBy>? sortBy;
  final Genders? genders;
  final List<ProductColors>? colors;

  ProductFilter({
    this.brands,
    this.priceRangeStart,
    this.priceRangeEnd,
    this.sortBy,
    this.genders,
    this.colors,
  });

  ProductFilter copyWith({
    List<Brands>? brands,
    int? priceRangeStart,
    int? priceRangeEnd,
    List<SortBy>? sortBy,
    Genders? genders,
    List<ProductColors>? colors,
  }) {
    return ProductFilter(
      brands: brands ?? this.brands,
      priceRangeStart: priceRangeStart ?? this.priceRangeStart,
      priceRangeEnd: priceRangeEnd ?? this.priceRangeEnd,
      sortBy: sortBy ?? this.sortBy,
      genders: genders ?? this.genders,
      colors: colors ?? this.colors,
    );
  }
}
