import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/app/get_dependencies.dart';
import 'package:shoesly/models/filter_model.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/constants/enums.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductFetched>(_onProductFetched);
    on<ProductFilterApplied>(_onProductFilterApplied);
    on<ProductFilterRemoved>(_onProductFilterRemoved); // New event handler
  }

  FutureOr<void> _onProductFetched(
      ProductFetched event, Emitter<ProductState> emit) async {
    try {
      // Fetch all products from your data source
      final allProducts = await productService.fetchProducts();

      allProducts.fold(
        (error) {
          emit(
            state.copyWith(
              productFetchedStatus: AppProgressStatus.failure,
              productFetchedError: error.message,
            ),
          );
        },
        (data) {
          final allProducts = data;
          // Filter products based on brand
          final adidasProducts = allProducts
              .where((product) => product.brand == Brands.adidas)
              .toList();
          final jordanProducts = allProducts
              .where((product) => product.brand == Brands.jordan)
              .toList();
          final nikeProducts = allProducts
              .where((product) => product.brand == Brands.nike)
              .toList();
          final pumaProducts = allProducts
              .where((product) => product.brand == Brands.puma)
              .toList();
          final reebokProducts = allProducts
              .where((product) => product.brand == Brands.reebok)
              .toList();
          final vansProducts = allProducts
              .where((product) => product.brand == Brands.vans)
              .toList();

          emit(
            state.copyWith(
              productFetchedStatus: AppProgressStatus.success,
              allProducts: allProducts,
              adidasProducts: adidasProducts,
              jordanProducts: jordanProducts,
              nikeProducts: nikeProducts,
              pumaProducts: pumaProducts,
              reebokProducts: reebokProducts,
              vansProducts: vansProducts,
              productFetchedError: '',
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          productFetchedStatus: AppProgressStatus.failure,
          productFetchedError: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onProductFilterApplied(
      ProductFilterApplied event, Emitter<ProductState> emit) async {
    final currentState = state;
    final filteredProducts =
        _filterProducts(currentState.allProducts, event.filter);

    emit(
      currentState.copyWith(
        filteredProducts: filteredProducts,
      ),
    );
  }

  List<ProductModel> _filterProducts(
      List<ProductModel> products, ProductFilter filter) {
    List<ProductModel> filteredProducts = products.where((product) {
      // Apply filter conditions here
      bool matchBrand = filter.brands == null ||
          filter.brands!.isEmpty ||
          filter.brands!.contains(product.brand);
      bool matchPriceRange =
          (filter.priceRangeStart == null || filter.priceRangeEnd == null) ||
              (product.price ?? 0) >= filter.priceRangeStart! &&
                  (product.price ?? 0) <= filter.priceRangeEnd!;
      bool matchGender =
          filter.genders == null || filter.genders == product.gender;
      bool matchColor = filter.colors == null ||
          filter.colors!.isEmpty ||
          (product.colors?.any((color) => filter.colors!.contains(color)) ??
              false);

      return matchBrand && matchPriceRange && matchGender && matchColor;
    }).toList();

    // Apply sorting
    if (filter.sortBy != null && filter.sortBy!.isNotEmpty) {
      if (filter.sortBy!.contains(SortBy.mostRecent)) {
        filteredProducts.sort((a, b) => (DateTime.tryParse(
                  b.dateAdded ?? DateTime.now().toString(),
                ) ??
                DateTime.now())
            .compareTo(
                DateTime.tryParse(a.dateAdded ?? DateTime.now().toString()) ??
                    DateTime.now()));
      }
      if (filter.sortBy!.contains(SortBy.lowestPrice)) {
        filteredProducts.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
      }
      if (filter.sortBy!.contains(SortBy.highestReview)) {
        filteredProducts.sort(
            (a, b) => (b.averageRating ?? 0).compareTo(a.averageRating ?? 0));
      }
    }

    return filteredProducts;
  }

  FutureOr<void> _onProductFilterRemoved(
      ProductFilterRemoved event, Emitter<ProductState> emit) {
    emit(
      state.copyWith(
        filteredProducts: state.allProducts,
      ),
    );
  }
}
