import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in_screen.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/sign_up_text_and_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpTextAndFields(),
              SizedBox(
                height: screenHeight * 0.14,
              ),
              Center(
                child: CustomGradientButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                   );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
