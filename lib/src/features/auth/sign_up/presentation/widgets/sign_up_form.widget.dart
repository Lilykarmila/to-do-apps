import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/core/utils/auth_service.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';

import '../../../../../commons/button.widget.dart';
import '../../../../../commons/text_form_field.dart';
import '../../../../../core/resources/form_validator.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidgets(
          controller: usernameController,
          titleText: 'Username',
          hintText: 'Username',
          borderRadius: 20,
          borderColor: AppColorTheme.primary500,
          focusColor: Colors.blue.shade200,
          backgroundColor: Colors.grey.shade100,
          enabledColor: Colors.grey.shade300,
          suffixIcon: Iconsax.user,
          validator: (value) => FormValidator.validateEmptyText('Username', value),
        ),
        TextFormFieldWidgets(
          controller: emailController,
          titleText: 'Email',
          hintText: 'email@example.com',
          borderRadius: 20,
          borderColor: AppColorTheme.primary500,
          focusColor: Colors.blue.shade200,
          backgroundColor: Colors.grey.shade100,
          enabledColor: Colors.grey.shade300,
          suffixIcon: Iconsax.check,
          validator: (value) => FormValidator.validateEmail(value),
        ),
        const SizedBox(height: 10),
        TextFormFieldWidgets(
          controller: passwordController,
          titleText: 'Password',
          hintText: '******',
          borderRadius: 20,
          isObsecure: true,
          borderColor: AppColorTheme.primary500,
          focusColor: Colors.blue.shade200,
          backgroundColor: Colors.grey.shade100,
          enabledColor: Colors.grey.shade300,
          suffixIcon: Iconsax.eye_slash,
          validator: (value) => FormValidator.validatePassword(value),
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          backgroundColor: AppColorTheme.primary400,
          width: 150,
          title: 'Sign up',
          borderRadius: 20,
          onPressed: () async {
            await AuthService.createAccountWithEmail(
              emailController.text,
              passwordController.text,
            ).then((value) {
              if (value == "Account Created") {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Account Created"),
                  backgroundColor: Colors.green,
                ));
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.routeName,
                  (Route<dynamic> route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            });
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
