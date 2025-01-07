import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/widgets/icon_button_widget.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/widgets/search.widget.dart';

import 'circular_container.widget.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.showSearch = true,
    required this.onLeftIconPressed,
    this.onRightIconPressed,
    this.iconColor = Colors.white,
  });

  final IconData? leftIcon, rightIcon;
  final Color iconColor;
  final bool showSearch;
  final VoidCallback? onLeftIconPressed;
  final void Function(BuildContext context)? onRightIconPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorTheme.primary300,
      child: Stack(
        children: [
          Positioned(
              top: 70,
              left: -50,
              child: CircularContainer(
                backgroundColor: AppColorTheme.whiteColor100.withOpacity(0.2),
              )),
          Positioned(
              top: -100,
              right: -100,
              child: CircularContainer(
                backgroundColor: AppColorTheme.whiteColor100.withOpacity(0.1),
              )),
          Container(
            margin: const EdgeInsets.only(top: 70),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 110.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonWidget(
                      onPressed: onLeftIconPressed,
                      icon: leftIcon ?? Iconsax.category,
                      color: iconColor,
                    ),

                    ///-- search widget
                    if (showSearch) const SearchWidget(),

                    IconButtonWidget(
                      onPressed: () => onRightIconPressed!(context),
                      icon: rightIcon ?? Iconsax.more,
                      color: iconColor,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today, 1 May',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'My Tasks',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
