import 'package:flutter/material.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.showArrow = true,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final effectiveIconColor = iconColor ?? scheme.primary;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? null
            : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Icon(icon, color: AppColor.primaryColor, size: 22),
          title: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 15,
              color: textColor ?? scheme.onSurface,
            ),
          ),
          trailing: showArrow
              ? Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: scheme.onSurfaceVariant,
          )
              : null,
        ),
      ),
    );
  }
}