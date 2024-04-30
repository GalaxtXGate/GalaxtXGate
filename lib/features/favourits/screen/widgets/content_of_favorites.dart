import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/gradient_title.dart';

class ContentOfFavorites extends StatelessWidget {
  const ContentOfFavorites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.textFieldsGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.deepGrey),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppImages.astronaut),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GradientTextColor(
                    text: 'Space Ships',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Mark 1',
                    style: TextStyles.textStyle16400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lorem ipsum dolor   ',
                    style: TextStyles.textStyle12400,
                  ),
                ],
              ),
              Spacer(),
         const FavoriteIcon()
              
            ],
            
          ),
        ),);
  }
}
