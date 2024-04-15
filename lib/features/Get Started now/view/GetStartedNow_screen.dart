import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/Get%20Started%20now/view/widgets/dark%20earth%20in%20space.dart';
import 'package:galaxyxgate/features/Get%20Started%20now/view/widgets/get_start_now_screen_background.dart';
import 'package:galaxyxgate/features/Get%20Started%20now/view/widgets/signup.dart';


class GetStartNowScreen extends StatefulWidget {
  const GetStartNowScreen({super.key});

  @override
  State<GetStartNowScreen> createState() => _GetStartNowScreenState();
}

class _GetStartNowScreenState extends State<GetStartNowScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
           const GetStartNowScreenBackground(),
            const DarkEarthInSpace(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.42.h,
              width: MediaQuery.of(context).size.width,
              child:Padding(
                padding: EdgeInsets.fromLTRB(19.w, 0,19.w, 13.h),
                child: SignUp(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
