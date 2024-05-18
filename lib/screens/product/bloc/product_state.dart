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
      ];
}
