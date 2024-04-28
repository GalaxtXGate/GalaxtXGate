import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/logic/sign_in/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/custom_text_field.dart';
import 'package:galaxyxgate/features/profile_picture/screen/profile_picture.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInTextAndFields extends StatelessWidget {
  SignInTextAndFields({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isScurePassword = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoading = true;
        } else if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePicture(),
            ),
          );
          isLoading = false;
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          isLoading = false;
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
                    top: screenHeight * 0.09,
                    bottom: screenHeight * 0.02,
                  ),
                  child: Image.asset(AppImages.appLogo),
                ),
                Text('Sign In', style: TextStyles.textStyle34),
                SizedBox(
                  height: screenHeight * 0.001,
                ),
                Text('get back in to continue exploring',
                    style: TextStyles.textStyle14300),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const CustomTextField(
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomTextField(
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                  isPassword: isScurePassword,
                  icon: IconButton(
                    onPressed: () {
                      isScurePassword = !isScurePassword;

                      //  setState(() {});
                    },
                    icon: isScurePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.18,
                ),
                Center(
                  child: state is SignInLoading
                      ? const CircularProgressIndicator()
                      : CustomGradientButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignInCubit>().signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            }
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
