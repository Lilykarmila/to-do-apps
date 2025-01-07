import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/theme/typography.theme.dart';

class SectionHeadingWidget extends StatelessWidget {
  const SectionHeadingWidget({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TypographyTextTheme.titleMedium,
          ),
        ),
        const Icon(Iconsax.arrow_down_1),
        const Icon(Iconsax.add)
      ],
    );
  }
}
