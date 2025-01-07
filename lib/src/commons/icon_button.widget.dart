import 'package:flutter/material.dart';

import '../config/theme/color.theme.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.height,
    this.color,
    required this.image,
    required this.onPressed,
    this.backgroundColor,
    required this.width,
  });
  final double height, width;
  final Color? color, backgroundColor;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? AppColorTheme.whiteColor100,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image(
          width: width,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
