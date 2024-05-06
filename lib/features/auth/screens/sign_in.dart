import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/animations/bottom_slide_transition.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/screens/sign_up.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/rows/toggle_row.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/sign_in_texts_and_fields.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: GradientGrayBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
              child: ListView(
                children: [
                  // App Logo
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(AppImages.appLogo),
                  ),
                  // Email & Password
                  const SignInTextAndFields(),
                  SizedBox(
                    height: 180.h,
                  ),
                  BlocProvider<SignInCubit>.value(
                    value: getIt<SignInCubit>(),
                    child: BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignInFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            messageSnackBar(message: state.message),
                          );
                        }
                        if (state is SignInSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            messageSnackBar(message: AppStrings.signInSuccess.tr()),
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
                        if (state is SignInLoading) {
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
                            if (SignInCubit.emailController.text.isNotEmpty &&
                                SignInCubit
                                    .passwordController.text.isNotEmpty) {
                              context.read<SignInCubit>().signIn();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                messageSnackBar(message:AppStrings.fillAllFields.tr()),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  // dont have account hint
                  ToggleRow(
                    hintText: AppStrings.haveAnAccount.tr(),
                    mainText: AppStrings.signUp.tr(),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        BottomSlideTransition(
                          page: const SignUp(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
