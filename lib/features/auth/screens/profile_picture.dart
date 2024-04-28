import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/add_profile_picture.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/texts.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
          ),
          child: BlocProvider<SignUpCubit>.value(
            value: getIt<SignUpCubit>(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Texts(),
                SizedBox(
                  height: 40.h,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return const AddProfilePicture();
                  },
                ),
                SizedBox(
                  height: 250.h,
                ),
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messageSnackBar(message: state.message),
                      );
                      Navigator.pop(context);
                    }
                    if (state is SignUpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messageSnackBar(message: "SignUp Success"),
                      );
                      Navigator.pushReplacement(
                        context,
                        LeftSlideTransition(
                          page: const BottomNavBar(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return GradientText(
                        colors: const [
                          AppColors.purple,
                          AppColors.blue,
                          AppColors.cyan,
                        ],
                        child: SpinKitWave(
                          color: Colors.grey,
                          size: 30.w,
                        ),
                      );
                    }
                    return CustomGradientButton(
                      onPressed: () {
                        if (SignUpCubit.passwordController.text ==
                            SignUpCubit.passwordConfirmController.text) {
                          if (SignUpCubit.emailController.text.isNotEmpty &&
                              SignUpCubit.passwordController.text.isNotEmpty) {
                            if (SignUpCubit.profilePic.value != null) {
                              context.read<SignUpCubit>().signUp();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                messageSnackBar(
                                    message: "Choose a profile picture"),
                              );
                            }
                          } else {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              messageSnackBar(message: "fille all fields"),
                            );
                          }
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            messageSnackBar(message: "Passwords do not match"),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
