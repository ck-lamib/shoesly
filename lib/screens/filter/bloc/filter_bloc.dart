import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/utils/constants/enums.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterByBrandSelected>(_onFilterByBrandSelected);
    on<FilterByPriceRangeSelected>(_onFilterByPriceRangeSelected);
    on<FilterBySortBySelected>(_onFilterBySortBySelected);
    on<FilterByGendersSelected>(_onFilterByGendersSelected);
    on<FilterByProductColorsSelected>(_onFilterByProductColorsSelected);
  }

  FutureOr<void> _onFilterByBrandSelected(
      FilterByBrandSelected event, Emitter<FilterState> emit) {
    final filteredBrands = List<Brands>.from(state.filteredBrands);

    if (filteredBrands.contains(event.brand)) {
      filteredBrands.remove(event.brand);
    } else {
      filteredBrands.add(event.brand);
    }

    emit(state.copyWith(filteredBrands: filteredBrands));
  }

  FutureOr<void> _onFilterByPriceRangeSelected(
      FilterByPriceRangeSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      filteredRangeStart: event.rangeStart,
      filteredRangeEnd: event.rangeEnd,
    ));
  }

  FutureOr<void> _onFilterBySortBySelected(
      FilterBySortBySelected event, Emitter<FilterState> emit) {
    // final filteredSortBy = List<SortBy>.from(state.filteredSortBy);

    // if (filteredSortBy.contains(event.sortBy)) {
    //   filteredSortBy.remove(event.sortBy);
    // } else {
    //   filteredSortBy.add(event.sortBy);
    // }

    emit(state.copyWith(filteredSortBy: event.sortBy));
  }

  FutureOr<void> _onFilterByGendersSelected(
      FilterByGendersSelected event, Emitter<FilterState> emit) {
    // final filteredGenders = List<Genders>.from(state.filteredGenders);

    // if (filteredGenders.contains(event.gender)) {
    //   filteredGenders.remove(event.gender);
    // } else {
    //   filteredGenders.add(event.gender);
    // }

    emit(state.copyWith(filteredGenders: event.gender));
  }

  FutureOr<void> _onFilterByProductColorsSelected(
      FilterByProductColorsSelected event, Emitter<FilterState> emit) {
    final filteredProductColors =
        List<ProductColors>.from(state.filteredProductColors);

    if (filteredProductColors.contains(event.productColor)) {
      filteredProductColors.remove(event.productColor);
    } else {
      filteredProductColors.add(event.productColor);
    }

    emit(state.copyWith(filteredProductColors: filteredProductColors));
  }
}
