import 'package:flutter/material.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/widgets/sign_up_footer.widget.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/widgets/sign_up_form.widget.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/widgets/sign_up_header.widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

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
                  const HeaderSignUpWidget(),
                  //form
                  SignUpFormWidget(
                    emailController: emailController,
                  ),

                  // footer
                  const FooterSignUpWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
