import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color? lineColor;
  final Color? textColor;

  const OrDivider({
    super.key,
    this.text = 'OR',
    this.lineColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultLineColor =
        lineColor ?? (isDark ? Colors.grey.shade700 : Colors.grey.shade300);
    final defaultTextColor =
        textColor ?? theme.textTheme.bodyMedium?.color ?? Colors.grey;

    return Row(
      children: [
        Expanded(child: Divider(color: defaultLineColor, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: defaultTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: Divider(color: defaultLineColor, thickness: 1)),
      ],
    );
  }
}
