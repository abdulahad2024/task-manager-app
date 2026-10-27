import 'package:flutter/material.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [


        const CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/158837112?v=4',
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            CustomText(
              text: "Hello Mojahid",
              fontSize: theme.textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w600,
            ),


            const SizedBox(height: 2),

            CustomText(
              text: "Welcome to Task Manager",
              fontSize: theme.textTheme.titleSmall?.fontSize,
            ),

          ],
        ),
      ],
    );
  }
}