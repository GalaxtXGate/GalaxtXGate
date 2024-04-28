import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<SignUpCubit>().getUserImage(AppGeneral.userUID!),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
          snapshot.hasData
              ? ClipOval(
                  child: DefultAppCachedNetworkImage(
                    height: 40.w,
                    width: 40.w,
                    url: snapshot.data!,
                  ),
                )
              : SpinKitRipple(
                  color: Colors.white,
                  size: 50.w,
                ),
    );
  }
}
