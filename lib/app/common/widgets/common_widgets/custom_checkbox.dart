import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final double size;
  final double borderRadius;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.size = 24.0,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = activeColor ?? theme.colorScheme.primary;
    final boxBorderColor = borderColor ?? (isDark ? Colors.grey.shade600 : Colors.grey.shade400);

    Widget checkboxWidget = GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: value ? primaryColor : boxBorderColor,
            width: 2,
          ),
        ),
        child: value
            ? Icon(
          Icons.check,
          size: size * 0.7,
          color: checkColor ?? Colors.white,
        )
            : null,
      ),
    );

    if (label != null) {
      return InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              checkboxWidget,
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  label!,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return checkboxWidget;
  }
}