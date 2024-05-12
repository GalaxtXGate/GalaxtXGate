import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/images/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/launches/data/models/launches/launches.dart';
import 'package:galaxyxgate/features/launches/screens/widgets/rows/launch_status.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import '../../../../../core/widgets/favorite_icon.dart';

class LaunchCard extends StatefulWidget {
  const LaunchCard({super.key, required this.launche});

  final Launche launche;

  @override
  State<LaunchCard> createState() => _LaunchCardState();
}

class _LaunchCardState extends State<LaunchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: widget.launche.links!.patch!.large != null
                    ? DefultAppCachedNetworkImage(
                        height: 165.h,
                        width: 100.w,
                        url: widget.launche.links!.patch!.large!,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        Icons.image_not_supported,
                        size: 100.w,
                        color: AppColors.deepGrey,
                      ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //fire date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientText(
                          colors: const [
                            AppColors.purple,
                            AppColors.blue,
                            AppColors.cyan
                          ],
                          child: Text(
                            widget.launche.dateUtc!.substring(0, 10),
                            style: TextStyles.font10White700w,
                          ),
                        ),
                        FavoriteIcon(
                          noFavFunction: () async {
                            await getIt<FavoriteCubit>().addOneFav(
                              addFav: AddFav(
                                id: widget.launche.id!,
                                category: "Launches",
                                name: widget.launche.name!,
                                description:
                                    widget.launche.details ?? "No Details",
                                image: widget.launche.links!.patch!.large ??
                                    'No Image',
                              ),
                              context: context,
                            );
                          },
                          favFunction: () async {
                            await getIt<FavoriteCubit>().removeOneFav(
                              id: widget.launche.id!,
                              context: context,
                            );
                          },
                          icon: Icons.favorite,
                          isFavourite: FavoriteCubit.favs.any(
                              (element) => element.id == widget.launche.id),
                        ),
                      ],
                    ),
                    // launch name
                    Text(
                      widget.launche.name!,
                      style: TextStyles.font16White700w,
                    ),
                    widget.launche.success != null
                        ? LaunchStatusRow(launche: widget.launche)
                        : Text(
                            "Unknown launch status",
                            style: TextStyles.font10White700w.copyWith(
                              color: Colors.red.withOpacity(0.7),
                            ),
                          ),
                    // launch details
                    Text(
                      widget.launche.details ?? "No Details",
                      style: TextStyles.font12White700w.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
