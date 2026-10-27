import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;
  final bool isIconRight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.isIconRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.primaryColor,
          foregroundColor: textColor ?? AppColor.white,
          disabledBackgroundColor: (backgroundColor ?? AppColor.primaryColor)
              .withValues(alpha: 0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null && !isIconRight) ...[
                    Icon(icon, size: 18, color: textColor ?? AppColor.white),
                    const SizedBox(width: 8),
                  ],

                  Text(
                    text,
                    style:
                        textStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                  ),

                  if (icon != null && isIconRight) ...[
                    const SizedBox(width: 8),
                    Icon(icon, size: 16, color: textColor ?? AppColor.white),
                  ],
                ],
              ),
      ),
    );
  }
}
