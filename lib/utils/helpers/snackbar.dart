import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:shoesly/utils/theme/colors.dart';

class ResponseData {
  final String? message;
  final Object? data;
  final ResponseStatus? responseStatus;

  ResponseData({this.message, this.data, this.responseStatus});
  ResponseData copyWith({
    String? message,
    Object? data,
    ResponseStatus? responseStatus,
  }) {
    return ResponseData(
      message: message ?? this.message,
      data: data ?? this.data,
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}

enum ResponseStatus {
  success,
  error,
}

class CustomSnackBar {
  static success({
    required BuildContext context,
    String? title,
    String? message,
    int duration = 3,
  }) {
    return Flushbar(
      title: title ?? "Successful",
      message: message ?? "The action was successful!",
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: AppColors.primaryColorLightest,
      ),
      borderRadius: BorderRadius.circular(15),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColors.successDarker,
    )..show(context);
  }

  static info({
    required BuildContext context,
    String? title,
    String? message,
    int duration = 3,
  }) {
    return Flushbar(
      title: title ?? "Info",
      message: message ?? "Something went wrong",
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.info_outline_rounded,
        color: AppColors.primaryColorLightest,
      ),
      borderRadius: BorderRadius.circular(15),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColors.secondaryDarker,
    ).show(context);
  }

  static error({
    required BuildContext context,
    String? title,
    String? message,
    int duration = 3,
  }) {
    return Flushbar(
      title: title ?? "Error!",
      message: message ?? "Unknown error! Please try again later!",
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(15),
      icon: const Icon(
        Icons.error_outline_rounded,
        color: AppColors.primaryColorLightest,
      ),
      borderRadius: BorderRadius.circular(15),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: AppColors.errorDarker,
    ).show(context);
  }
}
