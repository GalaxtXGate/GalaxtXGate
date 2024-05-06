import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon(
      {super.key,
      required this.isFavourite,
      required this.favFunction,
      required this.noFavFunction,
      this.icon});

  final bool isFavourite;
  final VoidCallback? favFunction;
  final VoidCallback? noFavFunction;
  final IconData? icon;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  ValueNotifier<bool> isFavourite = ValueNotifier<bool>(false);

  @override
  void initState() {
    isFavourite.value = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFavourite,
      builder: (context, bool value, wiget) => value
          ? ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    AppColors.loginTextGradientPurple,
                    AppColors.loginTextGradientPurple,
                    AppColors.loginTextGradientBlue,
                    AppColors.loginTextGradientGreen,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topCenter,
                ).createShader(bounds);
              },
              child: IconButton(
                iconSize: 29,
                onPressed: () {
                  if (widget.favFunction != null) {
                    widget.favFunction!();
                  }
                  isFavourite.value = !isFavourite.value;
                  HapticFeedback.heavyImpact();
                },
                icon: Icon(
                  widget.icon,
                  color: AppColors.white,
                ),
              ),
            )
          : IconButton(
              iconSize: 29,
              onPressed: () {
                if (widget.noFavFunction != null) {
                  widget.noFavFunction!();
                }
                isFavourite.value = !isFavourite.value;
                HapticFeedback.heavyImpact();
              },
              icon: Icon(
                widget.icon,
                color: AppColors.white,
              ),
            ),
    );
  }
}
