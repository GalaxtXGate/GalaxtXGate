import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/data/services/context_services.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_button.dart';

logOut() {
  CacheHelper.clearData();
  Navigator.pushNamedAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      Routes.signIn,
      (route) => false);
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      ),
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) => Dialog(
                  backgroundColor: AppColors.deepGrey,
                  child: SizedBox(
                    height: 200.h,
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        children: [
                          Text(
                           AppStrings.areSureYouWantToLogOut.tr(),
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
                           AppStrings.yourLocalDataWillBeRemoved.tr(),
                            style: TextStyles.font10White700w.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 100.w,
                                child: EditGradientButton(
                                  title: AppStrings.no.tr(),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                                width: 100.w,
                                child: EditGradientButton(
                                  title: AppStrings.yes.tr(),
                                  onPressed: () async {
                                    logOut();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      },
      child: Text(
        AppStrings.logout.tr(),
        style: TextStyles.font16White700w,
      ),
    );
  }
}
