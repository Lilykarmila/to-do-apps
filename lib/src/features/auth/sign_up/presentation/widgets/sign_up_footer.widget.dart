import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../commons/icon_button.widget.dart';
import '../../../login/presentation/pages/login_page.dart';

class FooterSignUpWidget extends StatelessWidget {
  const FooterSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or sign up with',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonWidget(
              height: 40,
              onPressed: () {},
              width: 30,
              image: 'assets/images/google.png',
            ),
            const SizedBox(width: 20),
            IconButtonWidget(
              onPressed: () {},
              height: 40,
              width: 35,
              image: 'assets/images/twitter.png',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already an account?',
              style: GoogleFonts.poppins(
                wordSpacing: -1,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Log in'),
            ),
          ],
        ),
      ],
    );
  }
}
