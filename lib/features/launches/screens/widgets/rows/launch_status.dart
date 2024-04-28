import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/launches/data/models/launches/launches.dart';

class LaunchStatusRow extends StatelessWidget {
  const LaunchStatusRow({
    super.key,
    required this.launche,
  });

  final Launche launche;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            height: 20.w,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: launche.success ?? false
                  ? Colors.green.withOpacity(0.7)
                  : Colors.red.withOpacity(0.7),
            ),
            child: Center(
              child: Icon(
                (launche.success != null && launche.success!)
                    ? Icons.check
                    : Icons.close,
                color: AppColors.deepBlack,
                size: 15.w,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            (launche.success != null && launche.success!)
                ? "Successful Launch"
                : "Failed Launch",
            style: TextStyles.font10White700w,
          ),
        ],
      ),
    );
  }
}
