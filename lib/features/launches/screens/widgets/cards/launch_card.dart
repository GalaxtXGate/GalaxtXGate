import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/features/launches/data/models/launches/launches.dart';
import 'package:galaxyxgate/features/launches/screens/widgets/rows/launch_status.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({super.key, required this.launche});
  final Launche launche;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: launche.links!.patch!.large != null
                ? DefultAppCachedNetworkImage(
                    height: 165.h,
                    width: 100.w,
                    url: launche.links!.patch!.large!,
                    fit: BoxFit.contain,
                  )
                : Icon(
                    Icons.image_not_supported,
                    size: 100.w,
                    color: AppColors.deepGrey,
                  ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //fire date
                Row(
                  children: [
                    GradientText(
                      colors: const [
                        AppColors.purple,
                        AppColors.blue,
                        AppColors.cyan
                      ],
                      child: Text(
                        launche.dateUtc!.substring(0, 10),
                        style: TextStyles.font10White700w,
                      ),
                    ),
                    const Spacer(),
                    FavoriteIcon(
                      onPressed: () {},
                      icon: Icons.favorite_border,
                    )
                  ],
                ),
                // launch name
                Text(
                  launche.name!,
                  style: TextStyles.font16White700w,
                ),
                launche.success != null
                    ? LaunchStatusRow(launche: launche)
                    : Text(
                        "Unknown launch status",
                        style: TextStyles.font10White700w.copyWith(
                          color: Colors.red.withOpacity(0.7),
                        ),
                      ),
                // launch details
                Text(
                  launche.details ?? "No Details",
                  style: TextStyles.font12White700w.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
