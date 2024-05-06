import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/icon_text_row.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';
import 'package:galaxyxgate/features/ships/presentation/widget/ship_features.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/favorite_icon.dart';
import '../../../favourits/data/service.dart/favorite_services.dart';
import '../../../favourits/logic/cubit/favourite_cubit.dart';

class ShipCard extends StatelessWidget {
  final ShipsModel ship;
  const ShipCard({super.key, required this.ship});

  String getImagePathForStatus(bool? active) {
    if (active == true) {
      return 'assets/images/active.svg';
    } else {
      return 'assets/images/inactive.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 15.h),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.deepGrey,
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                height: 200.h,
                width: 350.w,
                fit: BoxFit.cover,
                imageUrl: '${ship.image}',
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error_outline, color: AppColors.white),
                ),
                progressIndicatorBuilder: (context, url, progress) =>
                    const CupertinoActivityIndicator(),
              ),
            ),
            SizedBox(height: 5.h),
            //  Ship status, type, and year built
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTextRow(
                    imagePath: getImagePathForStatus(ship.active),
                    text: ship.active == true ? 'Active' : 'Not Active',
                  ),
                  IconTextRow(
                    imagePath: 'assets/icons/ship_type.svg',
                    text: '${ship.type}',
                  ),
                  IconTextRow(
                    imagePath: 'assets/icons/ship_calendar.svg',
                    text: ship.yearBuilt == null ? '1970' : '${ship.yearBuilt}',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Ship name, and legacyId
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: AppColors.maingGradientColor,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)
                            .createShader(bounds);
                      },
                      child: Text(
                        ship.legacyId == null ? 'Undefine' : '${ship.legacyId}',
                        style: TextStyles.font10White700w,
                      ),
                    ),
                    Text(
                      '${ship.name}',
                      style: TextStyles.font18White700w,
                    ),
                  ],
                ),
                FavoriteIcon(
                  noFavFunction: () async {
                    await getIt<FavoriteServices>().addFav(
                      addFav: AddFav(
                        id: ship.id!,
                        category: "Ships",
                        name: ship.name!,
                        description: ship.homePort,
                        image: ship.image ??
                            'No Image',
                      ),
                    );
                  },
                  favFunction: () async {
                    await getIt<FavoriteServices>()
                        .removeFav(id: ship.id!);
                  },
                  icon: Icons.favorite,
                  isFavourite: FavoriteCubit.favs.any(
                          (element) => element.id == ship.id),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            // Ship launch, port home, link article, and role
            ShipFeatures(ship: ship),
          ],
        ),
      ),
    );
  }
}
