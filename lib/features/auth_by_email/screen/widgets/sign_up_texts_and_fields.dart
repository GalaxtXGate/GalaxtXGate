import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/custom_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignUpTextAndFields extends StatefulWidget {
  const SignUpTextAndFields({super.key});

  @override
  State<SignUpTextAndFields> createState() => _SignUpTextAndFieldsState();
}

class _SignUpTextAndFieldsState extends State<SignUpTextAndFields> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  bottom: screenHeight * 0.02,
                ),
                child: Image.asset(AppImages.appLogo),
              ),
              Text('Sign Up', style: TextStyles.textStyle34),
              SizedBox(
                height: screenHeight * 0.001,
              ),
              Text('Create your account to continue exploring',
                  style: TextStyles.textStyle14300),
              SizedBox(
                height: screenHeight * 0.04,
              ),
            ],
          ),
          CustomTextField(
            
            hintText: 'Enter Your Email',
            labelText: 'Email',
            controller: emailController,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          CustomTextField(
            hintText: 'Enter Your Password',
            labelText: 'Password',
            controller: passwordController,
            isPassword: true,
            icon: const Icon(Icons.remove_red_eye),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          CustomTextField(
            hintText: 'Enter Your Password',
            labelText: 'Confirm Password',
            isPassword: true,
            controller: confirmPasswordController,
            icon: const Icon(Icons.remove_red_eye),
            validator: (value) {
              if (passwordController.text != confirmPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(
            height: screenHeight * 0.18,
          ),
          Center(
            child: CustomGradientButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                      Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Passwords do not match",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                 
                }
                
              },
            ),
          ),
        ],
      ),
    );
  }
}
