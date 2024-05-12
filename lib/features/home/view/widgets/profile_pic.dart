import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/widgets/images/defult_app_cached_network_image.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.size,
    this.userUrl,
    this.tag,
  });
  final double size;
  final String? userUrl;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'profilePic',
      child: ClipOval(
        child: DefultAppCachedNetworkImage(
          height: size,
          width: size,
          url: userUrl ?? AppGeneral.user.value!.profilePic!,
        ),
      ),
    );
  }
}
