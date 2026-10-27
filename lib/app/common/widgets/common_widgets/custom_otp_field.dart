import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class CustomOtpField extends StatelessWidget {
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final double boxSize;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const CustomOtpField({
    super.key,
    this.length = 6,
    required this.onChanged,
    this.onCompleted,
    this.boxSize = 48.0,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultFillColor = fillColor ?? (isDark ? Colors.grey.shade900 : const Color(0xFFF4FBF0));
    final defaultBorderColor = borderColor ?? (isDark ? Colors.grey.shade700 : Colors.grey.shade300);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(length, (index) {
        return SizedBox(
          width: boxSize,
          height: boxSize,
          child: TextFormField(
            onChanged: (value) {
              if (value.isNotEmpty && index < length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: defaultFillColor,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: defaultBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: defaultBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
              ),
            ),
          ),
        );
      }),
    );
  }
}