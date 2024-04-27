import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_images.dart';
import 'edit_button.dart';
import 'edit_text_field.dart';
class EditProfileData extends StatefulWidget {
  const EditProfileData({super.key});

  @override
  State<EditProfileData> createState() => _EditProfileDataState();
}

class _EditProfileDataState extends State<EditProfileData> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColors.darkLight,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderGreyWhite, width: 1.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30.h
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(AppImages.spaceManImage),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Change Photo",
                style: TextStyles.font14White700w.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.offWhite),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w,40.h, 20.w, 0.h),
                child: EditTextField(hintText: 'Enter New Email', labelText: 'Email',icon:  Image.asset(AppIcons.email),isSecure: false,),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w,20.h, 20.w, 10.h),
                child: EditTextField(hintText: 'Enter New Password', labelText: 'Password',icon:  Image.asset(AppIcons.lock),isSecure: true,),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0.h),
                  child: EditGradientButton(
                    title: "Save Changes",
                    onPressed: ()  {},
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
