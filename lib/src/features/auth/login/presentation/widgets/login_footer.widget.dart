import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

import '../../../../../commons/icon_button.widget.dart';

class FooterLoginWidget extends StatelessWidget {
  const FooterLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or log in with',
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
              'Dont have an account?',
              style: GoogleFonts.poppins(
                wordSpacing: -1,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ],
    );
  }
}
