// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/dark%20earth%20in%20space.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/get_start_now_screen_background.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/signup.dart';

class GetStartNowScreen extends StatelessWidget {
  const GetStartNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              const GetStartNowScreenBackground(),
              Transform.scale(
                scale: 1.05,
                child: const DarkEarthInSpace(),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.42.h,
                // width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(19.w, 0, 19.w, 13.h),
                  child: const SignUp(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
