import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/function/log_out.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_button.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.deepGrey,
      child: SizedBox(
        height: 170.h,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Text(
                AppStrings.areSureYouWantToLogOut.tr(context),
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
                AppStrings.yourLocalDataWillBeRemoved.tr(context),
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
                      title: AppStrings.no.tr(context),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 100.w,
                    child: EditGradientButton(
                      title: AppStrings.yes.tr(context),
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
    );
  }
}
