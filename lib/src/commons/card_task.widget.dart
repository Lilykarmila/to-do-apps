import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/theme/color.theme.dart';
import '../config/theme/typography.theme.dart';

class CardTaskWidget extends StatelessWidget {
  const CardTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: -5,
        //     blurRadius: 9,
        //     offset: Offset(8, 8),
        //   ),
        // ],
      ),
      child: const Column(
        children: [
          Column(
            children: [
              Text(
                'Calendar',
                style: TypographyTextTheme.titleSmall,
              ),
              SizedBox(height: 8),
              Icon(
                Iconsax.task,
                size: 30,
                color: AppColorTheme.primary400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
