import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/core/widgets/icon_text_row.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

String getImagePathForStatus(String status) {
  if (status == 'active') {
    return 'assets/images/active.svg';
  } else if (status == 'inactive') {
    return 'assets/images/inactive.svg';
  } else if (status == 'retired') {
    return 'assets/images/retired.svg';
  } else {
    return 'assets/images/unknown.svg';
  }
}

class FavCard extends StatelessWidget {
  const FavCard({
    super.key,
    required this.addFav,
    required this.favFunction,
    required this.noFavFunction,
    required this.icon,
  });
  final AddFav addFav;
  final VoidCallback? favFunction;
  final VoidCallback? noFavFunction;
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
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: addFav.image != null
                  ? DefultAppCachedNetworkImage(
                      height: 65.w,
                      width: 65.w,
                      url: addFav.image!,
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
                  if (addFav.category != "Crew")
                    Row(
                      children: [
                        GradientText(
                          colors: const [
                            AppColors.purple,
                            AppColors.blue,
                            AppColors.cyan,
                          ],
                          child: Text(
                            addFav.category ?? "No Category",
                          ),
                        ),
                        const Spacer(),
                        FavoriteIcon(
                          isFavourite: true,
                          favFunction: favFunction,
                          noFavFunction: noFavFunction,
                          icon: icon,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        addFav.name ?? "No name",
                        style: TextStyles.textStyle16400,
                      ),
                      if (addFav.category == "Crew") const Spacer(),
                      if (addFav.category == "Crew")
                        FavoriteIcon(
                          isFavourite: true,
                          favFunction: favFunction,
                          noFavFunction: noFavFunction,
                          icon: icon,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (addFav.category != "Crew")
                    SizedBox(
                      width: 250,
                      child: Text(
                        addFav.description ?? "No Details",
                        style: TextStyles.textStyle12400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (addFav.category == "Crew")
                    IconTextRow(
                      imagePath: getImagePathForStatus(addFav.status!),
                      text: addFav.status!,
                    ),
                  if (addFav.category == "Crew")
                    IconTextRow(
                      imagePath: 'assets/images/launch.svg',
                      text: addFav.launchNum == "1"
                          ? '${addFav.launchNum} Launch'
                          : '${addFav.launchNum} Launches',
                    ),
                  // Display agency
                  if (addFav.category == "Crew")
                    IconTextRow(
                      imagePath: 'assets/images/agency.svg',
                      text: addFav.org ?? "No Org",
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
