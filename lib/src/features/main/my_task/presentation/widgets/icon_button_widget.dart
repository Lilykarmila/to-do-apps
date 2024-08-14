import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;

  const IconButtonWidget({
    required this.onPressed,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      // onTap: onPressed,
      // child: Icon(icon, color: color),
    );
  }
}
