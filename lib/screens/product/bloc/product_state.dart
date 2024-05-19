part of 'product_bloc.dart';

class ProductState extends Equatable {
  final AppProgressStatus productFetchedStatus;
  final List<ProductModel> allProducts;
  final List<ProductModel> filteredProducts;
  final List<ProductModel> adidasProducts;
  final List<ProductModel> jordanProducts;
  final List<ProductModel> nikeProducts;
  final List<ProductModel> pumaProducts;
  final List<ProductModel> reebokProducts;
  final List<ProductModel> vansProducts;
  final String productFetchedError;
  final int currentPage;
  final bool hasReachedMax;
  const ProductState({
    this.productFetchedStatus = AppProgressStatus.initial,
    this.allProducts = const [],
    this.filteredProducts = const [],
    this.adidasProducts = const [],
    this.jordanProducts = const [],
    this.nikeProducts = const [],
    this.pumaProducts = const [],
    this.reebokProducts = const [],
    this.vansProducts = const [],
    this.productFetchedError = "",
    this.currentPage = 1,
    this.hasReachedMax = false,
  });

  ProductState copyWith({
    AppProgressStatus? productFetchedStatus,
    List<ProductModel>? allProducts,
    List<ProductModel>? filteredProducts,
    List<ProductModel>? adidasProducts,
    List<ProductModel>? jordanProducts,
    List<ProductModel>? nikeProducts,
    List<ProductModel>? pumaProducts,
    List<ProductModel>? reebokProducts,
    List<ProductModel>? vansProducts,
    String? productFetchedError,
    int? currentPage,
    int? totalPages,
    bool? hasReachedMax,
  }) {
    return ProductState(
      productFetchedStatus: productFetchedStatus ?? this.productFetchedStatus,
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      adidasProducts: adidasProducts ?? this.adidasProducts,
      jordanProducts: jordanProducts ?? this.jordanProducts,
      nikeProducts: nikeProducts ?? this.nikeProducts,
      pumaProducts: pumaProducts ?? this.pumaProducts,
      reebokProducts: reebokProducts ?? this.reebokProducts,
      vansProducts: vansProducts ?? this.vansProducts,
      productFetchedError: productFetchedError ?? this.productFetchedError,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        productFetchedStatus,
        allProducts,
        filteredProducts,
        adidasProducts,
        jordanProducts,
        nikeProducts,
        pumaProducts,
        reebokProducts,
        vansProducts,
        productFetchedError,
        currentPage,
        hasReachedMax,
      ];
}
