
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class AppThemes {
  AppThemes._();

  // ---------------------------------------------------------------------------
  // Design tokens
  // ---------------------------------------------------------------------------

  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;

  static const double buttonHeight = 50;
  static const double inputHeight = 52;
  static const double borderWidth = 1;
  static const double focusedBorderWidth = 1.5;

  static const Duration animationDuration = Duration(milliseconds: 200);

  // ---------------------------------------------------------------------------
  // Public themes
  // ---------------------------------------------------------------------------

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    palette: _ThemePalette.light,
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    palette: _ThemePalette.dark,
  );

  // ---------------------------------------------------------------------------
  // Theme builder
  // ---------------------------------------------------------------------------

  static ThemeData _buildTheme({
    required Brightness brightness,
    required _ThemePalette palette,
  }) {
    final bool isDark = brightness == Brightness.dark;

    final BorderRadius buttonRadius =
    BorderRadius.circular(radiusMd);

    final RoundedRectangleBorder componentShape =
    RoundedRectangleBorder(borderRadius: buttonRadius);

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: brightness,
    ).copyWith(
      primary: AppColor.primaryColor,
      onPrimary: AppColor.white,
      secondary: AppColor.primaryDark,
      onSecondary: AppColor.white,
      error: AppColor.errorColor,
      onError: AppColor.white,
      surface: palette.surface,
      onSurface: palette.textPrimary,
      onSurfaceVariant: palette.textSecondary,
      outline: palette.border,
      outlineVariant: palette.border.withValues(alpha: 0.65),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,

      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: palette.background,
      canvasColor: palette.background,
      dividerColor: palette.border,

      fontFamily: GoogleFonts.poppins().fontFamily,

      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashFactory: InkRipple.splashFactory,

      // -----------------------------------------------------------------------
      // System UI
      // -----------------------------------------------------------------------

      appBarTheme: AppBarTheme(
        backgroundColor: palette.background,
        foregroundColor: palette.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        systemOverlayStyle: _systemOverlayStyle(isDark),
        titleTextStyle: _text(
          18,
          FontWeight.w600,
          palette.textPrimary,
        ),
        iconTheme: IconThemeData(
          color: palette.textPrimary,
          size: 24,
        ),
      ),

      // -----------------------------------------------------------------------
      // Typography
      // -----------------------------------------------------------------------

      textTheme: _textTheme(palette),

      // -----------------------------------------------------------------------
      // Icons
      // -----------------------------------------------------------------------

      iconTheme: IconThemeData(
        color: palette.textSecondary,
        size: 24,
      ),

      // -----------------------------------------------------------------------
      // Inputs
      // -----------------------------------------------------------------------

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.inputFill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: _text(
          14,
          FontWeight.w400,
          palette.textHint,
        ),
        labelStyle: _text(
          14,
          FontWeight.w500,
          palette.textSecondary,
        ),
        floatingLabelStyle: _text(
          14,
          FontWeight.w500,
          AppColor.primaryColor,
        ),
        errorStyle: _text(
          12,
          FontWeight.w400,
          AppColor.errorColor,
        ),
        prefixIconColor: palette.textSecondary,
        suffixIconColor: palette.textSecondary,
        border: _inputBorder(palette.border),
        enabledBorder: _inputBorder(palette.border),
        disabledBorder: _inputBorder(
          palette.border.withValues(alpha: 0.5),
        ),
        focusedBorder: _inputBorder(
          AppColor.focusedBorderColor,
          width: focusedBorderWidth,
        ),
        errorBorder: _inputBorder(AppColor.errorColor),
        focusedErrorBorder: _inputBorder(
          AppColor.errorColor,
          width: focusedBorderWidth,
        ),
      ),

      // -----------------------------------------------------------------------
      // Elevated buttons
      // -----------------------------------------------------------------------

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.white,
          disabledBackgroundColor:
          AppColor.primaryColor.withValues(alpha: 0.4),
          disabledForegroundColor:
          AppColor.white.withValues(alpha: 0.7),
          minimumSize: const Size(64, buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          shape: componentShape,
          elevation: 0,
          textStyle: _text(
            16,
            FontWeight.w600,
            AppColor.white,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Outlined buttons
      // -----------------------------------------------------------------------

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primaryColor,
          minimumSize: const Size(64, buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          shape: componentShape,
          side: const BorderSide(
            color: AppColor.primaryColor,
          ),
          textStyle: _text(
            14,
            FontWeight.w600,
            AppColor.primaryColor,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Text buttons
      // -----------------------------------------------------------------------

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primaryColor,
          minimumSize: const Size(48, 44),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          shape: componentShape,
          textStyle: _text(
            14,
            FontWeight.bold,
            AppColor.primaryColor,
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Icon buttons
      // -----------------------------------------------------------------------

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: palette.textSecondary,
          minimumSize: const Size(44, 44),
          shape: componentShape,
        ),
      ),

      // -----------------------------------------------------------------------
      // Cards
      // -----------------------------------------------------------------------

      cardTheme: CardThemeData(
        color: palette.surface,
        elevation: isDark ? 0 : 1,
        shadowColor: palette.shadow,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: componentShape,
        clipBehavior: Clip.antiAlias,
      ),

      // -----------------------------------------------------------------------
      // List tiles
      // -----------------------------------------------------------------------

      listTileTheme: ListTileThemeData(
        iconColor: palette.textSecondary,
        textColor: palette.textPrimary,
        tileColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        shape: componentShape,
      ),

      // -----------------------------------------------------------------------
      // Checkboxes
      // -----------------------------------------------------------------------

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.primaryColor;
            }
            return Colors.transparent;
          },
        ),
        checkColor: WidgetStateProperty.all(AppColor.white),
        side: BorderSide(color: palette.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXs),
        ),
      ),

      // -----------------------------------------------------------------------
      // Radio buttons
      // -----------------------------------------------------------------------

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.primaryColor;
            }
            return palette.textSecondary;
          },
        ),
      ),

      // -----------------------------------------------------------------------
      // Switches
      // -----------------------------------------------------------------------

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.white;
            }
            return palette.textHint;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.primaryColor;
            }
            return palette.border;
          },
        ),
      ),

      // -----------------------------------------------------------------------
      // Dialogs
      // -----------------------------------------------------------------------

      dialogTheme: DialogThemeData(
        backgroundColor: palette.surface,
        surfaceTintColor: Colors.transparent,
        elevation: isDark ? 0 : 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
        ),
        titleTextStyle: _text(
          18,
          FontWeight.w600,
          palette.textPrimary,
        ),
        contentTextStyle: _text(
          14,
          FontWeight.w400,
          palette.textSecondary,
        ),
      ),

      // -----------------------------------------------------------------------
      // Bottom sheets
      // -----------------------------------------------------------------------

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: palette.surface,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: palette.surface,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radiusXl),
          ),
        ),
      ),

      // -----------------------------------------------------------------------
      // Snackbars
      // -----------------------------------------------------------------------

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
        isDark ? palette.surface : const Color(0xFF1F2937),
        elevation: 4,
        contentTextStyle: _text(
          14,
          FontWeight.w400,
          AppColor.white,

        ),
        shape: componentShape,
        insetPadding: const EdgeInsets.all(16),
      ),

      // -----------------------------------------------------------------------
      // Dividers
      // -----------------------------------------------------------------------

      dividerTheme: DividerThemeData(
        color: palette.border,
        thickness: 1,
        space: 1,
      ),

      // -----------------------------------------------------------------------
      // Progress indicators
      // -----------------------------------------------------------------------

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.primaryColor,
        linearTrackColor: palette.border,
        circularTrackColor: palette.border,
      ),

      // -----------------------------------------------------------------------
      // Text selection
      // -----------------------------------------------------------------------

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.primaryColor,
        selectionColor:
        AppColor.primaryColor.withValues(alpha: 0.25),
        selectionHandleColor: AppColor.primaryColor,
      ),

      // -----------------------------------------------------------------------
      // Tooltips
      // -----------------------------------------------------------------------

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF374151)
              : const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(radiusSm),
        ),
        textStyle: _text(
          12,
          FontWeight.w400,
          AppColor.white,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Typography helper
  // ---------------------------------------------------------------------------

  static TextTheme _textTheme(_ThemePalette palette) {
    return TextTheme(
      displayLarge: _text(32, FontWeight.w700, palette.textPrimary),
      displayMedium: _text(28, FontWeight.w700, palette.textPrimary),
      displaySmall: _text(24, FontWeight.w700, palette.textPrimary),

      headlineLarge: _text(22, FontWeight.w600, palette.textPrimary),
      headlineMedium: _text(20, FontWeight.w600, palette.textPrimary),
      headlineSmall: _text(16, FontWeight.w500, palette.textPrimary),

      titleLarge: _text(18, FontWeight.w600, palette.textPrimary),
      titleMedium: _text(16, FontWeight.w600, palette.textPrimary),
      titleSmall: _text(14, FontWeight.w600, palette.textPrimary),

      bodyLarge: _text(16, FontWeight.w400, palette.textPrimary),
      bodyMedium: _text(14, FontWeight.w400, palette.textSecondary),
      bodySmall: _text(12, FontWeight.w400, palette.textHint),

      labelLarge: _text(14, FontWeight.w600, palette.textPrimary),
      labelMedium: _text(12, FontWeight.w500, palette.textSecondary),
      labelSmall: _text(11, FontWeight.w500, palette.textHint),
    );
  }  // ---------------------------------------------------------------------------
  // Reusable style helpers
  // ---------------------------------------------------------------------------

  static TextStyle _text(
      double fontSize,
      FontWeight fontWeight,
      Color color,
      ) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static OutlineInputBorder _inputBorder(
      Color color, {
        double width = borderWidth,
      }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusMd),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  static SystemUiOverlayStyle _systemOverlayStyle(
      bool isDark,
      ) {
    final Brightness iconBrightness =
    isDark ? Brightness.light : Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconBrightness,
      statusBarBrightness:
      isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: iconBrightness,
      systemNavigationBarContrastEnforced: false,
    );
  }
}

// =============================================================================
// Internal palette
// =============================================================================

class _ThemePalette {
  const _ThemePalette({
    required this.background,
    required this.surface,
    required this.inputFill,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.shadow,
  });

  final Color background;
  final Color surface;
  final Color inputFill;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color shadow;

  static final _ThemePalette light = _ThemePalette(
    background: AppColor.scaffoldBackground,
    surface: AppColor.surfaceColor,
    inputFill: AppColor.textFromColor,
    border: AppColor.borderColor,
    textPrimary: AppColor.primaryTextColor,
    textSecondary: AppColor.secondaryTextColor,
    textHint: AppColor.hintTextColor,
    shadow: AppColor.grey300.withValues(alpha: 0.25),
  );

  static const _ThemePalette dark = _ThemePalette(
    background: Color(0xFF111827),
    surface: Color(0xFF1F2937),
    inputFill: Color(0xFF1F2937),
    border: Color(0xFF374151),
    textPrimary: AppColor.white,
    textSecondary: AppColor.grey300,
    textHint: AppColor.grey400,
    shadow: Colors.transparent,
  );


}
