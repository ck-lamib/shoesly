import 'package:flutter/material.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/text_styles.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColorDefault,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColorDefault,
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: _textTheme,
      colorScheme: const ColorScheme.light(
        background: AppColors.whiteColor,
      ),

      fontFamily: "Urbanist",
      appBarTheme: _lightAppBarTheme,
      // iconTheme: const IconThemeData(
      //   color: AppColors.primarycolor,
      // ),
      // icon
      // textButtonTheme: _lightTextButtonTheme,
      // listTileTheme: _lightListTileTheme,
      tabBarTheme: _lightTabBarTheme,
      floatingActionButtonTheme: _lightFloatingActionButtonTheme,
      // bottomAppBarTheme: _lightBottomAppBarTheme,
      elevatedButtonTheme: _lightElevatedButtonTheme,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.whiteColor,
          modalBackgroundColor: AppColors.whiteColor,
          modalBarrierColor: AppColors.primaryColorDefault.withOpacity(0.3),
          shadowColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        prefixIconColor: AppColors.primaryColorDefault,
        suffixIconColor: AppColors.primaryColorDefault,
        fillColor: AppColors.primaryColorLightest,
        filled: false,
        // suffixIcon: (suffixIcon != null) ? suffixIcon : null,

        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColorDefault,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColorDefault,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColorDefault,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.redAccent),
        hintStyle: _textTheme.bodyLarge?.copyWith(
          color: AppColors.primaryColorLighter,
        ),
        labelStyle: _textTheme.bodyLarge?.copyWith(
          color: AppColors.primaryColorLighter,
        ),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: AppTextStyle.headingLarge,
      headlineMedium: AppTextStyle.headingMedium,
      headlineSmall: AppTextStyle.headingSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      labelLarge: AppTextStyle.button,
    );
  }

  static FloatingActionButtonThemeData get _lightFloatingActionButtonTheme {
    return const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorDefault,
      foregroundColor: AppColors.whiteColor,
    );
  }

  static ElevatedButtonThemeData get _lightElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: AppColors.primaryColorDefault,
        foregroundColor: AppColors.whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        maximumSize: const Size.fromHeight(
          50,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: _textTheme.labelLarge,
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }

  static OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: AppColors.primaryColorDefault,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        side: const BorderSide(
          color: AppColors.borderColor,
        ),
        maximumSize: const Size.fromHeight(
          50,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: _textTheme.labelLarge,
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }

  static TabBarTheme get _lightTabBarTheme {
    return TabBarTheme(
      labelStyle: _textTheme.headlineMedium,
      unselectedLabelStyle: _textTheme.headlineMedium,
      labelColor: AppColors.primaryColorDefault,
      unselectedLabelColor: AppColors.primaryColorLighter,
      indicator: const BoxDecoration(),
      splashFactory: NoSplash.splashFactory,
      labelPadding: const EdgeInsets.only(right: 20),
    );
  }

  static AppBarTheme get _lightAppBarTheme {
    return const AppBarTheme().copyWith(
      elevation: 0,
      scrolledUnderElevation: 0,
      // titleTextStyle: const TextStyle(
      //   color: AppColors.primaryColorDefault,
      //   fontWeight: FontWeight.w800,
      //   fontSize: 22,
      // ),
      // // actionsIconTheme: const IconThemeData(
      // //   color: AppColors.textcolor,
      // // ),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: AppColors.primarycolordark,
      //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
      // ),
    );
  }

  // static TextButtonThemeData get _lightTextButtonTheme {
  //   return TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       textStyle: _textTheme.labelLarge,
  //     ),
  //   );
  // }

  // static ListTileThemeData get _lightListTileTheme {
  //   return ListTileThemeData(
  //     tileColor: AppColors.whiteColor,
  //     titleTextStyle: _textTheme.titleMedium?.copyWith(
  //       color: AppColors.textcolor,
  //     ),
  //     subtitleTextStyle: _textTheme.bodySmall?.copyWith(
  //       color: AppColors.secondaryTextcolor,
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //   );
  // }

  // static TabBarTheme get _lightTabBarTheme {
  //   return TabBarTheme(
  //     labelStyle: _textTheme.bodySmall?.copyWith(
  //       fontSize: 11,
  //       fontWeight: FontWeight.w600,
  //     ),
  //     unselectedLabelStyle: _textTheme.bodySmall?.copyWith(fontSize: 11),
  //     labelColor: AppColors.primarycolor,
  //     indicatorColor: AppColors.primarycolor,
  //   );
  // }

//   static BottomAppBarTheme get _lightBottomAppBarTheme {
//     return const BottomAppBarTheme(
//       color: AppColors.whiteColor,
//       elevation: 50,
//     );
//   }
}


  // static AppBarTheme get _darkAppBarTheme {
  //   return AppBarTheme(
  //     surfaceTintColor: Colors.transparent,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     scrolledUnderElevation: 0,
  //     titleTextStyle: TextStyle(
  //       color: AppColors.textcolordark,
  //       fontWeight: FontWeight.w800,
  //       fontSize: 22,
  //     ),
  //     actionsIconTheme: IconThemeData(
  //       color: AppColors.textcolordark,
  //     ),
  //   );
  // }

// static ElevatedButtonThemeData get _evatedButtonTheme {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primarycolor,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         textStyle: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 17,
//         ),
//         splashFactory: InkRipple.splashFactory,
//       ),
//     );
//   }






// ThemeData lightTheme = ThemeData(
//   scaffoldBackgroundColor: AppColors.backgroundColor,
//   primaryColor: AppColors.primarycolor,
//   brightness: Brightness.light,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primarycolor,
//       textStyle: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 17,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       splashFactory: InkRipple.splashFactory,
//     ),
//   ),
//   expansionTileTheme: const ExpansionTileThemeData(
//     shape: RoundedRectangleBorder(
//       side: BorderSide(color: Colors.transparent),
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     iconColor: AppColors.primarycolor,
//     enabledBorder: inputBorder(Colors.transparent),
//     border: inputBorder(Colors.transparent),
//     focusedBorder: inputBorder(AppColors.primarycolor),
//     focusedErrorBorder: inputBorder(Colors.red),
//     errorBorder: inputBorder(Colors.red),
//     prefixIconColor: AppColors.primarycolor,
//     suffixIconColor: AppColors.primarycolor,
//     fillColor: Colors.grey.withOpacity(0.1),
//     filled: true,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: AppColors.primarycolor,
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     surfaceTintColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       color: AppColors.textcolor,
//       fontWeight: FontWeight.w800,
//       fontSize: 22,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: AppColors.textcolor,
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       // Status bar color
//       statusBarColor: Colors.red,

//       statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//       statusBarBrightness: Brightness.light, // For iOS (dark icons)
//     ),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor: MaterialStatePropertyAll(AppColors.primarycolor),
//     overlayColor: MaterialStatePropertyAll(AppColors.primarycolor),
//   ),
//   navigationBarTheme: const NavigationBarThemeData(
//     backgroundColor: Colors.white,
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     selectedItemColor: AppColors.primarycolor,
//   ),
//   cardTheme: const CardTheme(
//     color: Colors.white,
//     surfaceTintColor: Colors.transparent,
//   ),
// // searchBarTheme: const SearchBarThemeData(
// //   side: MaterialStatePropertyAll(BorderSide.none),
// //   backgroundColor: MaterialStatePropertyAll(Colors.red),
// // ),
//   useMaterial3: true,
// );

// OutlineInputBorder inputBorder(Color color) {
//   return OutlineInputBorder(
//     borderSide: BorderSide(
//       color: color,
//       width: 2,
//     ),
//     borderRadius: BorderRadius.circular(16),
//   );
// }

// ThemeData darkTheme = ThemeData(
//   scaffoldBackgroundColor: const Color(0xff202124),
//   primaryColor: AppColors.primarycolordark,
//   brightness: Brightness.dark,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primarycolor,
//       textStyle: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 17,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     surfaceTintColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       color: AppColors.textcolordark,
//       fontWeight: FontWeight.w800,
//       fontSize: 22,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: AppColors.textcolordark,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     iconColor: AppColors.primarycolor,
//     enabledBorder: inputBorder(Colors.transparent),
//     border: inputBorder(Colors.transparent),
//     focusedBorder: inputBorder(AppColors.primarycolor),
//     focusedErrorBorder: inputBorder(Colors.red),
//     errorBorder: inputBorder(Colors.red),
//     prefixIconColor: AppColors.primarycolor,
//     suffixIconColor: AppColors.primarycolor,
//     fillColor: Colors.grey.withOpacity(0.1),
//     filled: true,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: AppColors.primarycolor,
//     ),
//   ),
//   cardTheme: const CardTheme(
//     color: Color(0xff424242),
//   ),
//   useMaterial3: true,
// );
