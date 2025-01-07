import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/core/utils/auth_service.dart';
import 'package:to_do_apps/src/core/resources/form_validator.dart';
import 'package:to_do_apps/src/features/main/root/presentation/page/root_pages.dart';

import '../../../../../commons/button.widget.dart';
import '../../../../../commons/text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

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
          suffixIcon: Iconsax.check,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => FormValidator.validateEmail(value),
        ),
        const SizedBox(height: 20),
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
          validator: (value) => FormValidator.validateEmptyText('Password', value),
        ),
        const SizedBox(height: 20),
        ButtonWidget(
            backgroundColor: AppColorTheme.primary400,
            width: 150,
            title: 'Log in',
            borderRadius: 20,
            onPressed: () async {
              await AuthService.loginWithEmail(
                emailController.text,
                passwordController.text,
              ).then((value) {
                if (value == "Login Successful") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        "Login Success",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green[700]));
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RootPage.routeName,
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
            }),
        const SizedBox(height: 40),
      ],
    );
  }
}
