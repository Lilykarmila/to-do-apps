import 'package:flutter/material.dart';

class PopMenuWidget extends StatelessWidget {
  const PopMenuWidget({
    super.key,
    required this.menuList,
    this.icon,
  });
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
