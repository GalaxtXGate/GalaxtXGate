import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/widgets/containers/bottom_nav_bar_container.dart';

class BluredBottomNavBar extends StatefulWidget {
  const BluredBottomNavBar(
      {super.key,
      required this.icons,
      required this.screens,
      required this.gradientColors,
      required this.notSelectedColor});
  final List<String> icons;
  final List<Widget> screens;
  final List<Color> gradientColors;
  final Color notSelectedColor;

  @override
  State<BluredBottomNavBar> createState() => _BluredBottomNavBarState();
}

class _BluredBottomNavBarState extends State<BluredBottomNavBar> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: widget.screens,
                onPageChanged: (value) {},
              ),
            ),
            Positioned(
              right: 55.w,
              left: 55.w,
              bottom: 35.h,
              child: BottomNavBarContainer(
                icons: widget.icons,
                gradientColors: widget.gradientColors,
                notSelectedColor: widget.notSelectedColor,
                pageController: pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
