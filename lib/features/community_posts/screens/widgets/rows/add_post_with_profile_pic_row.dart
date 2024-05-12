import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/add_post_page.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';

class AddPostWithProfilePicRow extends StatefulWidget {
  const AddPostWithProfilePicRow({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<AddPostWithProfilePicRow> createState() =>
      _AddPostWithProfilePicRowState();
}

class _AddPostWithProfilePicRowState extends State<AddPostWithProfilePicRow> {
  double previousOffset = 0;
  double baseHieght = 60.h;
  double animationHieght = 0;

  ValueNotifier<double> height = ValueNotifier<double>(60.h);
  

  @override
  void initState() {
    widget.scrollController.addListener(() {
      double currentOffset = widget.scrollController.position.pixels;
      if (currentOffset > previousOffset) {
        height.value = animationHieght;
      } else if (currentOffset < previousOffset) {
        height.value = baseHieght;
      }
      previousOffset = currentOffset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: height,
      builder: (BuildContext context, double currentHieght, Widget? child) =>
          AnimatedContainer(
        height: currentHieght,
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePic(
              size: 60.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Stack(
              children: [
                Container(
                  height: baseHieght,
                  width: 260.w,
                  decoration: BoxDecoration(
                    color: AppColors.deepGrey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "What’s on your mind ?".tr(context),
                        style: TextStyles.font14White700w.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      if (currentHieght == baseHieght)
                        Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 25.w,
                        ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            LeftSlideTransition(
                              page: const AddPostPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
