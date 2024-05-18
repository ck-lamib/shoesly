part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductFetched extends ProductEvent {}

class ProductFilterApplied extends ProductEvent {
  final ProductFilter filter;

  const ProductFilterApplied(this.filter);

  @override
  List<Object> get props => [filter];
}

class ProductFilterRemoved extends ProductEvent {}
