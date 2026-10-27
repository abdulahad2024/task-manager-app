
import 'package:flutter/material.dart';

/// Centralized color tokens for the application.
///
/// Keep all application-specific colors here.
/// Component styling belongs in AppThemes.
abstract final class AppColor {
  AppColor._();

  // ---------------------------------------------------------------------------
  // Brand colors
  // ---------------------------------------------------------------------------

  static const Color primaryColor = Color(0xFF84C000);
  static const Color primaryLight = Color(0xFFEBF7D3);
  static const Color primaryDark = Color(0xFF5E8A00);

  static const Color onPrimary = white;
  static const Color onPrimaryLight = Color(0xFF263900);

  // ---------------------------------------------------------------------------
  // Text colors
  // ---------------------------------------------------------------------------

  static const Color primaryTextColor = Color(0xFF111827);
  static const Color secondaryTextColor = Color(0xFF4B5563);
  static const Color hintTextColor = Color(0xFF9CA3AF);
  static const Color softColor = Color(0xFFF7FFEF);

  static const Color textOnDark = Color(0xFFF9FAFB);
  static const Color secondaryTextOnDark = Color(0xFFD1D5DB);

  // ---------------------------------------------------------------------------
  // Background and surface colors
  // ---------------------------------------------------------------------------

  static const Color scaffoldBackground = Color(0xFFF9FAFB);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textFromColor = Color(0xFFF7FFEF);

  static const Color darkBackground = Color(0xFF111827);
  static const Color darkSurface = Color(0xFF1F2937);
  static const Color darkInputFill = Color(0xFF1F2937);

  // ---------------------------------------------------------------------------
  // Border and divider colors
  // ---------------------------------------------------------------------------

  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color focusedBorderColor = primaryColor;

  static const Color darkBorder = Color(0xFF374151);

  // ---------------------------------------------------------------------------
  // Semantic colors
  // ---------------------------------------------------------------------------

  static const Color successColor = Color(0xFF10B981);
  static const Color successBackground = Color(0xFFD1FAE5);

  static const Color errorColor = Color(0xFFEF4444);
  static const Color errorBackground = Color(0xFFFEE2E2);

  static const Color warningColor = Color(0xFFF59E0B);
  static const Color warningBackground = Color(0xFFFEF3C7);

  static const Color infoColor = Color(0xFF3B82F6);
  static const Color infoBackground = Color(0xFFDBEAFE);

  // ---------------------------------------------------------------------------
  // Neutral palette
  // ---------------------------------------------------------------------------

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);
}
