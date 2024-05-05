import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon(
      {super.key, this.isFavourite, required this.onPressed, this.icon});
  bool? isFavourite;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            AppColors.loginTextGradientPurple,
            AppColors.loginTextGradientPurple,
            AppColors.loginTextGradientBlue,
            AppColors.loginTextGradientGreen
          ],
          begin: Alignment.centerLeft,
          end: Alignment.topCenter,
        ).createShader(bounds);
      },
      child: IconButton(
        iconSize: 29,
        onPressed: widget.onPressed,
        icon: Icon(
          widget.icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
