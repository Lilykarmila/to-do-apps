import 'package:flutter/material.dart';
import '../widgets/login_footer.widget.dart';
import '../widgets/login_form.widget.dart';
import '../widgets/login_header.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //header
                  const HeaderLoginWidget(),

                  //form
                  LoginFormWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),

                  // footer
                  const FooterLoginWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
