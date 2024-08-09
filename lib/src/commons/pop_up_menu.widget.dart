import 'package:flutter/material.dart';

class PopMenuWidget extends StatelessWidget {
  const PopMenuWidget({
    Key? key,
    required this.menuList,
    this.icon,
  }) : super(key: key);
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
