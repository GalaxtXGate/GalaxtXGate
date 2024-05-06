import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/data/services/context_services.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/custom_text_field.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/edit_button.dart';

logOut() {
  CacheHelper.clearData();
  Navigator.pushNamedAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      Routes.signIn,
      (route) => false);
}

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      ),
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) => StatefulBuilder(
                  builder: (BuildContext context,
                          void Function(void Function()) setState) =>
                      Dialog(
                    backgroundColor: AppColors.deepGrey,
                    child: SizedBox(
                      height: 300.h,
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          children: [
                            Text(
                            AppStrings.areSureYouWantToDeleteYourAccount.tr(),
                              style: TextStyles.font16White700w.copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColors.offWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                            AppStrings.yourDataWillBeRemoved.tr(),
                              style: TextStyles.font10White700w.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "You Must Enter your Password to Confirm",
                              style: TextStyles.font10White700w.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextField(
                              height: 60.h,
                              hintText: '* * * * * *',
                              labelText: 'Password',
                              controller: SignUpCubit.passwordController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                  width: 100.w,
                                  child: EditGradientButton(
                                  title:AppStrings.no.tr(),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: 100.w,
                                  child: BlocProvider<SignUpCubit>.value(
                                    value: getIt<SignUpCubit>(),
                                    child:
                                        BlocConsumer<SignUpCubit, SignUpState>(
                                      listener: (context, state) {
                                        if (state is DeleteAccountFailure) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            messageSnackBar(
                                              message: state.message,
                                            ),
                                          );
                                        }
                                        if (state is DeleteAccountSuccess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            messageSnackBar(
                                            message: AppStrings.deleteAccountSuccess.tr(),
                                            ),
                                          );
                                          logOut();
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is DeleteAccountLoading) {
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
                                        return EditGradientButton(
                                        title: AppStrings.yes.tr(),
                                          onPressed: () async {
                                            if (SignUpCubit.passwordController
                                                .text.isNotEmpty) {
                                              await context
                                                  .read<SignUpCubit>()
                                                  .deleteAccount();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                messageSnackBar(
                                                    message:
                                                        "Please Enter Your Password "),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      },
      child: Text(
       AppStrings.deleteAccount.tr(),
        style: TextStyles.font16White700w,
      ),
    );
  }
}
