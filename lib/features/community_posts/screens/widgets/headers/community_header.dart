import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CommunityHeader extends StatefulWidget {
  const CommunityHeader({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<CommunityHeader> createState() => _CommunityHeaderState();
}

class _CommunityHeaderState extends State<CommunityHeader> {
  double previousOffset = 0;
  ValueNotifier<double> height = ValueNotifier<double>(140.h);

  @override
  void initState() {
    widget.scrollController.addListener(() {
      double currentOffset = widget.scrollController.position.pixels;
      if (currentOffset > previousOffset) {
        height.value = 45.h;
      } else if (currentOffset < previousOffset) {
        height.value = 140.h;
      }
      previousOffset = currentOffset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: height,
      builder: (BuildContext context, double currentHeight, Widget? child) =>
          AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: currentHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.maingGradientColor,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GalaxyXGate",
                    style: TextStyles.font28White700w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.verified_rounded,
                    color: AppColors.cyan,
                    size: 25.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            if (currentHeight == 140.h)
              Flexible(
                child: SizedBox(
                  width: 200.w,
                  child: Text(
                    "Welcome to GalaxyXGate’s official community".tr(context),
                    style: TextStyles.font14White700w,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
