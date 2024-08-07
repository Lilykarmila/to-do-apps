import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';

import '../../../../../commons/button.widget.dart';
import '../../../../../commons/text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidgets(
          controller: emailController,
          titleText: 'Email',
          hintText: 'email@example.com',
          borderRadius: 20,
          borderColor: AppColorTheme.primary500,
          focusColor: Colors.blue.shade200,
          backgroundColor: Colors.grey.shade100,
          enabledColor: Colors.grey.shade300,
          suffixIcon: Icons.mail_outline_rounded,
        ),
        const SizedBox(height: 20),
        TextFormFieldWidgets(
          controller: emailController,
          titleText: 'Password',
          hintText: '******',
          borderRadius: 20,
          borderColor: AppColorTheme.primary500,
          focusColor: Colors.blue.shade200,
          backgroundColor: Colors.grey.shade100,
          enabledColor: Colors.grey.shade300,
          suffixIcon: Icons.mail_outline_rounded,
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          backgroundColor: AppColorTheme.primary400,
          width: 150,
          title: 'Log in',
          borderRadius: 20,
          onPressed: () {},
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
