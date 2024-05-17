import 'package:flutter/widgets.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';

/// App Text Style Definitions
class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    fontWeight: AppFontWeight.regular,
    color: AppColors.primaryColorDefault,
  );

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Heading large Text Style
  static TextStyle get headingLarge {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Heading med Text Style
  static TextStyle get headingMedium {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Heading small Text Style
  static TextStyle get headingSmall {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Title large Text Style
  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Title Text Style
  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Title small Text Style
  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Body large Text Style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Body med Text Style
  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Body small Text Style
  static TextStyle get bodySmall {
    return _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: AppFontWeight.regular,
    );
  }
}
