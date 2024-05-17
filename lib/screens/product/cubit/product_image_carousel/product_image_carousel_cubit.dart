import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/utils/constants/enums.dart';

part 'product_image_carousel_state.dart';

class ProductImageCarouselCubit extends Cubit<ProductImageCarouselState> {
  ProductImageCarouselCubit()
      : super(
          const ProductImageCarouselState(),
        );

  onImageSlided(int index) => emit(
        state.copyWith(
          imageIndex: index,
        ),
      );

  onColorSelected(ProductColors productColors) => emit(
        state.copyWith(
          productColors: productColors,
        ),
      );
}


// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// class ProductImageCarouselCubit extends Cubit<int> {
//   ProductImageCarouselCubit() : super(0);

//   onImageSlided(int index) => emit(index);
// }

