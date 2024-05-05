import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class ContentOfFavorites extends StatelessWidget {
  const ContentOfFavorites({
    super.key,
    required this.Title,
    required this.Name,
    required this.Description,
    required this.image,
    required this.onPressed,
    required this.icon,
  });
  final String Title;
  final String Name;
  final String Description;
  final String image;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.deepGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: image != null
                  ? DefultAppCachedNetworkImage(
                      height: 165.h,
                      width: 100.w,
                      url: image,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      Icons.image_not_supported,
                      size: 100.w,
                      color: AppColors.deepGrey,
                    ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GradientText(
                        colors: const [
                          AppColors.purple,
                          AppColors.blue,
                          AppColors.cyan,
                        ],
                        child: Text(
                          Title,
                        ),
                      ),
                      const Spacer(),
                      FavoriteIcon(
                        isFavourite: true,
                        onPressed: onPressed,
                        icon: icon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    Name,
                    style: TextStyles.textStyle16400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      Description,
                      style: TextStyles.textStyle12400,
                      maxLines: 30,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
