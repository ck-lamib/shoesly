part of 'product_image_carousel_cubit.dart';

class ProductImageCarouselState extends Equatable {
  final int imageIndex;
  final ProductColors productColors;

  const ProductImageCarouselState({
    this.imageIndex = 0,
    this.productColors = ProductColors.grey,
  });

  ProductImageCarouselState copyWith({
    int? imageIndex,
    ProductColors? productColors,
  }) =>
      ProductImageCarouselState(
        imageIndex: imageIndex ?? this.imageIndex,
        productColors: productColors ?? this.productColors,
      );

  @override
  List<Object> get props => [
        imageIndex,
        productColors,
      ];
}
