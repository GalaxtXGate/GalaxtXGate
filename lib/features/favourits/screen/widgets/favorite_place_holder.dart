import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class FavoritsPlaceHolder extends StatelessWidget {
  const FavoritsPlaceHolder({
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
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SizedBox(
                      height: 210.h,
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
          ],
        ),
      ),
    );
  }
}
