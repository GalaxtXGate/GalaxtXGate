import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/view/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/view/widgets/sign_up_texts_and_fields.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
