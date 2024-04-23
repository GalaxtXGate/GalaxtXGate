import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/profile_picture/logic/cubits/profile_picture_cubit.dart';
import 'package:galaxyxgate/features/profile_picture/view/widgets/add_profile_picture.dart';
import 'package:galaxyxgate/features/profile_picture/view/widgets/texts.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfilePictureCubit(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Texts(),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const AddProfilePicture(),
                SizedBox(
                  height: screenHeight * 0.23,
                ),
                CustomGradientButton(
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
