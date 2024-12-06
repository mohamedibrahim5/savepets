import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save/core/utils/app_colors.dart';

import '../../core/utils/style_manager.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.offWhite),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: AppColors.offWhite),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: getBoldStyle(color: Colors.white, fontSize: 35),
        displayMedium: getSemiBoldStyle(color: Colors.black, fontSize: 16),
        titleMedium: getMediumStyle(color: Colors.white, fontSize: 20),
        titleSmall: getMediumStyle(color: Colors.blue, fontSize: 30),
        bodySmall: getRegularStyle(color: Colors.grey),
        bodyLarge: getRegularStyle(color: Colors.blueGrey, fontSize: 28),
        bodyMedium: getMediumStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
