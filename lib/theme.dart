import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFBC0100);
  static const Color primaryRedLight = Color(0xFFBC000C);
  static const Color backgroundLight = Color(0xFFF9F9F9);
  static const Color textDark = Color(0xFF1A1C1C);
  static const Color primaryDark = Color(0xFF1A1C1C);
  static const Color textBrown = Color(0xFF603E39);
  static const Color textMain = Color(0xFF1A1C1C);
  static const Color glassWhite = Color(0x14FFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);
  
  // New tokens for Video Hub
  static const Color hintText = Color(0xFF956D67);
  static const Color searchBackground = Color(0xFFF3F3F3);
  static const Color cardGradientStart = Color(0x001A1C1C);
  static const Color cardGradientEnd = Color(0xFF1A1C1C);
  static const Color podiumGlass = Color(0x0AFFFFFF);
  static const Color grayBorder = Color(0xFFEEEEEE);
}

class AppTypography {
  // Base font styles
  static TextStyle get beVietnamProBlack => GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w900,
  );

  static TextStyle get beVietnamProBlackItalic => GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  static TextStyle get manropeBold => GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
  );

  static TextStyle get beVietnamExtraBold =>
      GoogleFonts.beVietnamPro(fontWeight: FontWeight.w900);

  static TextStyle get beVietnamProExtraBold =>
      GoogleFonts.beVietnamPro(fontWeight: FontWeight.w800);

  static TextStyle get beVietnamProBold =>
      GoogleFonts.beVietnamPro(fontWeight: FontWeight.w700);

  static TextStyle get interBold =>
      GoogleFonts.inter(fontWeight: FontWeight.w700);

  static TextStyle get interSemiBold =>
      GoogleFonts.inter(fontWeight: FontWeight.w600);

  static TextStyle get interMedium =>
      GoogleFonts.inter(fontWeight: FontWeight.w500);

  static TextStyle get interRegular =>
      GoogleFonts.inter(fontWeight: FontWeight.w400);

  // Semantic styles used in screens
  static TextStyle get labelLarge =>
      interBold.copyWith(fontSize: 12, letterSpacing: 1.2);
  static TextStyle get titleLarge =>
      beVietnamProBold.copyWith(fontSize: 18, height: 1.2);
  static TextStyle get titleMedium =>
      beVietnamProBold.copyWith(fontSize: 16, height: 1.2);
  static TextStyle get titleSmall =>
      beVietnamProBold.copyWith(fontSize: 14, height: 1.2);
  static TextStyle get bodyLarge =>
      interMedium.copyWith(fontSize: 16, height: 1.5);
  static TextStyle get bodyMedium =>
      interMedium.copyWith(fontSize: 14, height: 1.5);
  static TextStyle get bodySmall =>
      interMedium.copyWith(fontSize: 12, height: 1.5);
  static TextStyle get headlineLarge =>
      beVietnamProBlackItalic.copyWith(fontSize: 32, height: 1.1);
  static TextStyle get headlineMedium =>
      beVietnamProExtraBold.copyWith(fontSize: 24, height: 1.2);
  static TextStyle get headlineSmall =>
      beVietnamProExtraBold.copyWith(fontSize: 20, height: 1.2);
}

class AppTextStyles {
  static TextStyle headingBlack(double size) {
    return AppTypography.beVietnamProBlackItalic.copyWith(
      fontSize: size,
      color: Colors.white,
      height: 1.1,
    );
  }

  static TextStyle headingBold(double size, {Color color = Colors.white}) {
    return AppTypography.beVietnamProBold.copyWith(
      fontSize: size,
      color: color,
      height: 1.2,
    );
  }

  static TextStyle bodyMedium(double size, {Color color = Colors.white}) {
    return AppTypography.interMedium.copyWith(
      fontSize: size,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle bodyRegular(double size, {Color color = Colors.white}) {
    return AppTypography.interRegular.copyWith(
      fontSize: size,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle bodySemiBold(double size, {Color color = Colors.white}) {
    return AppTypography.interSemiBold.copyWith(
      fontSize: size,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle bodyBold(double size, {Color color = Colors.white}) {
    return AppTypography.interBold.copyWith(
      fontSize: size,
      color: color,
      height: 1.5,
    );
  }
}
