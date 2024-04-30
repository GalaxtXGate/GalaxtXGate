import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}
bool isFavourite = true;
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
          ], // Gradient colors
          begin: Alignment.centerLeft, // Gradient start position
          end: Alignment.topCenter, // Gradient end position
        ).createShader(bounds);
      },
      child: IconButton(
        iconSize: 29,
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
        
        icon: isFavourite?  const Icon(
          Icons.favorite,
          color: AppColors.white,
        ): const Icon(
          Icons.favorite_border,
          color: AppColors.white,
        ),
      ),
    );
  }
}
