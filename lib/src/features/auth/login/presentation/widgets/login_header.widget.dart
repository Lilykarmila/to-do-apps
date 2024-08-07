import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/theme/color.theme.dart';

class HeaderLoginWidget extends StatelessWidget {
  const HeaderLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/login.png',
          height: 200,
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome back!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColorTheme.primary500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
