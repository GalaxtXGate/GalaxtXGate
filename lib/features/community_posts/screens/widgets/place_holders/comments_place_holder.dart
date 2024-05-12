import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CommentsPlaceHolder extends StatelessWidget {
  const CommentsPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.w,
        left: 20.w,
        top: 10.h,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.deepGrey,
        highlightColor: Colors.grey.withOpacity(0.5),
        child: SizedBox(
          height: 660.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  height: 80.h,
                  child: Card(
                    child: ListTile(
                      title: Text('Item number $index as title'),
                      subtitle: const Text('Subtitle here'),
                      trailing: const Icon(Icons.ac_unit),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
