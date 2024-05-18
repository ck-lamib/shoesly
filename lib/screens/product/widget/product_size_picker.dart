import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/screens/product/cubit/product_size_picker/product_size_picker_cubit.dart';
import 'package:shoesly/utils/theme/colors.dart';

class ProductSizePicker extends StatelessWidget {
  const ProductSizePicker({
    super.key,
    required this.sizes,
  });

  final List sizes;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return sizes.isEmpty
        ? Container(
            margin: const EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            child: Text(
              "No sizes available",
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColorLight,
              ),
            ),
          )
        : BlocBuilder<ProductSizePickerCubit, int>(
            builder: (context, state) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<ProductSizePickerCubit>(context)
                          .onSizeSelected(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == state
                            ? AppColors.primaryColorDefault
                            : null,
                        border: Border.all(
                          color: index == state
                              ? Colors.transparent
                              : AppColors.borderColor,
                        ),
                      ),
                      child: Text(
                        "${sizes[index]}",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: index == state
                              ? AppColors.whiteColor
                              : AppColors.primaryColorLight,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}
