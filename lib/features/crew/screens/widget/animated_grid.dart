import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/features/crew/data/models/crew.dart';
import 'package:galaxyxgate/core/widgets/rows/icon_text_row.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../favourits/data/models/add_fav/add_fav.dart';
import '../../../favourits/logic/cubit/favourite_cubit.dart';

class AnimatedCrewGrid extends StatelessWidget {
  final List<Crew>? crewList;

  const AnimatedCrewGrid({super.key, required this.crewList});

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

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 310.h,
          crossAxisCount: 2,
          crossAxisSpacing: 16.0.w,
          mainAxisSpacing: 16.0.w,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final crew = crewList![index];

            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 500.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.r,
                        color: AppColors.deepGrey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display crew image
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: CachedNetworkImage(
                                height: 150.h,
                                width: 125.w,
                                fit: BoxFit.cover,
                                imageUrl: crew.image,
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(Icons.error_outline),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        const CupertinoActivityIndicator(),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // Display crew name and favorite icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  crew.name.replaceFirst(' ', '\n'),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font16White700w.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              FavoriteIcon(
                                noFavFunction: () async {
                                  await getIt<FavoriteCubit>().addOneFav(
                                    addFav: AddFav(
                                      id: crew.id,
                                      category: "Crew",
                                      name: crew.name,
                                      image: crew.image,
                                      status: crew.status,
                                      launchNum:
                                          crew.launches.length.toString(),
                                      org: crew.agency,
                                    ),
                                    context: context,
                                  );
                                },
                                favFunction: () async {
                                  await getIt<FavoriteCubit>().removeOneFav(
                                    id: crew.id,
                                    context: context,
                                  );
                                },
                                icon: Icons.favorite,
                                isFavourite: FavoriteCubit.favs.any(
                                  (element) => element.id == crew.id,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          // Display crew status
                          IconTextRow(
                            imagePath: getImagePathForStatus(crew.status),
                            text: crew.status,
                          ),
                          // Display launches count
                          IconTextRow(
                            imagePath: 'assets/images/launch.svg',
                            text: crew.launches.length == 1
                                ? '${crew.launches.length} Launch'
                                : '${crew.launches.length} Launches',
                          ),
                          // Display agency
                          IconTextRow(
                            imagePath: 'assets/images/agency.svg',
                            text: crew.agency,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: crewList!.length,
        ),
      ),
    );
  }
}
