part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterByBrandSelected extends FilterEvent {
  final Brands brand;
  const FilterByBrandSelected({required this.brand});
}

class FilterByPriceRangeSelected extends FilterEvent {
  final int rangeStart;
  final int rangeEnd;
  const FilterByPriceRangeSelected({
    required this.rangeStart,
    required this.rangeEnd,
  });
}

class FilterBySortBySelected extends FilterEvent {
  final SortBy sortBy;
  const FilterBySortBySelected({required this.sortBy});
}

class FilterByGendersSelected extends FilterEvent {
  final Genders gender;
  const FilterByGendersSelected({required this.gender});
}

class FilterByProductColorsSelected extends FilterEvent {
  final ProductColors productColor;
  const FilterByProductColorsSelected({required this.productColor});
}
