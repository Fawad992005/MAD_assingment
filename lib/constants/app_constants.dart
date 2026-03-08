import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0D1117);

  static const Color surface = Color(0xFF161B27);

  static const Color statCard = Color(0xFF1C2333);

  static const Color border = Color(0xFF252D3D);

  static const Color primary = Color(0xFF2962FF);
  static const Color primaryLight = Color(0xFF4D7AFF);

  static const Color heroOverlayStart = Color(0x00000000);
  static const Color heroOverlayEnd = Color(0xDD0D1117);

  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFE8EAF0);
  static const Color textSecondary = Color(0xFF8B95A8);
  static const Color textHint = Color(0xFF545F72);

  static const Color favRing = Color(0xFFFFFFFF);
}

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Poppins';

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    letterSpacing: 0.2,
  );

  static const TextStyle destinationTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    letterSpacing: 0.3,
  );

  static const TextStyle sectionHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.65,
  );

  static const TextStyle statValue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle locationText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle ctaLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    letterSpacing: 0.4,
  );

  static const TextStyle termsLink = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textSecondary,
  );
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppRadius {
  AppRadius._();
  static const double sm = 8.0;
  static const double md = 14.0;
  static const double lg = 20.0;
  static const double pill = 100.0;
}
