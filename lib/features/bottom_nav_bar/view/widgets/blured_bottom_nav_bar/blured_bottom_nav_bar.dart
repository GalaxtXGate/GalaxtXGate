import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/widgets/containers/bottom_nav_bar_container.dart';

class BluredBottomNavBar extends StatefulWidget {
  const BluredBottomNavBar(
      {super.key,
      required this.icons,
      required this.screens,
      required this.gradientColors,
      required this.notSelectedColor,
      required this.scrollController});
  final List<String> icons;
  final List<Widget> screens;
  final List<Color> gradientColors;
  final Color notSelectedColor;
  final ScrollController scrollController;

  @override
  State<BluredBottomNavBar> createState() => _BluredBottomNavBarState();
}

class _BluredBottomNavBarState extends State<BluredBottomNavBar> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  double previousOffset = 0;
  double baseBottom = 35.h;
  double animatedBottom = -50.h;

  ValueNotifier<double> bottom = ValueNotifier<double>(35.h);

  @override
  void initState() {
    widget.scrollController.addListener(() {
      double currentOffset = widget.scrollController.position.pixels;
      if (currentOffset > previousOffset) {
        bottom.value = animatedBottom;
      } else if (currentOffset < previousOffset) {
        bottom.value = baseBottom;
      }
      previousOffset = currentOffset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async => false,
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
            ValueListenableBuilder(
              valueListenable: bottom,
              builder:
                  (BuildContext context, double currentBottom, Widget? child) =>
                      AnimatedPositioned(
                right: 40.w,
                left: 40.w,
                bottom: currentBottom,
                duration: const Duration(milliseconds: 500),
                child: Stack(
                  children: [
                    BottomNavBarContainer(
                      icons: widget.icons,
                      gradientColors: widget.gradientColors,
                      notSelectedColor: widget.notSelectedColor,
                      pageController: pageController,
                    ),
                    if (bottom.value != baseBottom)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                bottom.value = baseBottom;
                              },
                              child: const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
