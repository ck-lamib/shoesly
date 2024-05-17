part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<Brands> filteredBrands;
  final int filteredRangeStart;
  final int filteredRangeEnd;
  final List<SortBy> filteredSortBy;
  final List<Genders> filteredGenders;
  final List<ProductColors> filteredProductColors;
  const FilterState({
    this.filteredBrands = const [],
    this.filteredRangeStart = 0,
    this.filteredRangeEnd = 0,
    this.filteredSortBy = const [],
    this.filteredGenders = const [],
    this.filteredProductColors = const [],
  });

  FilterState copyWith({
    List<Brands>? filteredBrands,
    int? filteredRangeStart,
    int? filteredRangeEnd,
    List<SortBy>? filteredSortBy,
    List<Genders>? filteredGenders,
    List<ProductColors>? filteredProductColors,
  }) {
    return FilterState(
      filteredBrands: filteredBrands ?? this.filteredBrands,
      filteredRangeStart: filteredRangeStart ?? this.filteredRangeStart,
      filteredRangeEnd: filteredRangeEnd ?? this.filteredRangeEnd,
      filteredSortBy: filteredSortBy ?? this.filteredSortBy,
      filteredGenders: filteredGenders ?? this.filteredGenders,
      filteredProductColors:
          filteredProductColors ?? this.filteredProductColors,
    );
  }

  @override
  List<Object> get props => [
        filteredBrands,
        filteredRangeStart,
        filteredRangeEnd,
        filteredSortBy,
        filteredGenders,
        filteredProductColors,
      ];
}
