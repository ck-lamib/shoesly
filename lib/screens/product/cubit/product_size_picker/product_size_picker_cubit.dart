import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'product_size_picker_state.dart';

class ProductSizePickerCubit extends Cubit<int> {
  ProductSizePickerCubit() : super(0);
  onSizeSelected(int index) => emit(index);
}
