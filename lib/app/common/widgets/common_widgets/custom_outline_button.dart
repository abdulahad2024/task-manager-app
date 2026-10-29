import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomOutlineButton({
    super.key,
    required this.label,
    this.icon,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 1.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: textColor),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
