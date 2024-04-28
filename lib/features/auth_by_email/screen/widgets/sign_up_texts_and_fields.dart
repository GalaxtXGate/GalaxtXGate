import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/logic/sign_up/sign_up_cubit.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/custom_text_field.dart';

class SignUpTextAndFields extends StatelessWidget {
   SignUpTextAndFields({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    bool isPasswordVisible = true;
    bool isPasswordNotVisible = true;
    
    
  @override
  Widget build(BuildContext context) {
  
  double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const SignIn()));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
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
                  isPassword: isPasswordVisible,
                  icon: IconButton(
                    onPressed: () {
                      isPasswordVisible = !isPasswordVisible;

                      // setState(() {});
                    },
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomTextField(
                  hintText: 'Enter Your Password',
                  labelText: 'Confirm Password',
                  isPassword: isPasswordNotVisible,
                  controller: confirmPasswordController,
                  icon: IconButton(
                    onPressed: () {
                      isPasswordNotVisible = !isPasswordNotVisible;
                      //setState(() {});
                    },
                    icon: isPasswordNotVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.18,
                ),
                Center(
                  child: state is SignUpLoading
                      ? CircularProgressIndicator()
                      : CustomGradientButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().signUp(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            }
                            ;
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
