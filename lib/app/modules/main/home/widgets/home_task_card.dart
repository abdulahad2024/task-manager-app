import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/image/app_image.dart';

class HomeTaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const HomeTaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? theme.cardColor : const Color(0xFFFCFDF8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    AppImage.taskCardImage,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset(
                              height: 35,
                              width: 35,
                              AppImage.task,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      CustomText(
                        text: title,
                        fontSize: theme.textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w600,
                      ),

                      const SizedBox(height: 10),

                      CustomText(
                        text: subtitle,
                        height: 1.5,
                        maxLines: 2,
                        fontSize: theme.textTheme.titleSmall?.fontSize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
