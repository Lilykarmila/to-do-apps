import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/theme/color.theme.dart';

class HeaderSignUpWidget extends StatelessWidget {
  const HeaderSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/signup.png',
          height: 200,
        ),
        const SizedBox(height: 10),
        Text(
          'Lets get started!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColorTheme.primary500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
