import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/function/launch_url_browser.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/favorite_icon.dart';
import 'package:galaxyxgate/core/widgets/icon_text_row.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

class RocketDetailsInfo extends StatelessWidget {
  final RocketsModel rocket;

  const RocketDetailsInfo({super.key, required this.rocket});

  /// Returns the image path for the given status.
  String _getImagePathForStatus(bool? active) {
    return active == true
        ? 'assets/images/active.svg'
        : 'assets/images/inactive.svg';
  }

  /// Extracts the year from the given date.
  String _extractYearFromDate(String? date) {
    if (date == null) return '';
    return date.split('-')[0];
  }

  /// Widget for displaying the rocket image.
  Widget _buildRocketImage() {
    return Hero(
      transitionOnUserGestures: true,
      tag: '${rocket.id}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: CachedNetworkImage(
          height: 200.h,
          width: 350.w,
          fit: BoxFit.cover,
          imageUrl: rocket.flickrImages?.first ?? '',
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error_outline, color: AppColors.white),
          ),
          progressIndicatorBuilder: (context, url, progress) =>
              const CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  /// Widget for displaying the rocket status, company, and country.
  Widget _buildRocketInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconTextRow(
          imagePath: _getImagePathForStatus(rocket.active),
          text: rocket.active == true ? 'Currently Active' : 'Not Active',
        ),
        IconTextRow(
          imagePath: 'assets/icons/rocket_space.svg',
          text: '${rocket.company}',
        ),
        IconTextRow(
          imagePath: 'assets/icons/rocket_globe.svg',
          text: rocket.country?.replaceFirst('Republic of the ', '') ?? '',
        ),
      ],
    );
  }

  /// Widget for displaying rocket engine type, name, and description.
  Widget _buildRocketDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: AppColors.maingGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: Text(
                  rocket.engines?.type != null
                      ? rocket.engines!.type![0].toUpperCase() +
                          rocket.engines!.type!.substring(1)
                      : "Merlin",
                  style: TextStyles.font10White700w,
                ),
              ),
              Text(
                ' ${rocket.name}',
                style: TextStyles.font18White700w,
              ),
              Text(
                rocket.description ?? '',
                style: TextStyles.font12White700w.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
        FavoriteIcon(
          noFavFunction: () async {
            await getIt<FavoriteServices>().addFav(
              addFav: AddFav(
                id: rocket.id,
                category: "Rockets",
                name: rocket.name,
                image: rocket.flickrImages!.first,
              ),
            );
          },
          favFunction: () async {
            await getIt<FavoriteServices>().removeFav(
              id: rocket.id!,
            );
          },
          icon: Icons.favorite,
          isFavourite: FavoriteCubit.favs.any(
            (element) => element.id == rocket.id,
          ),
        ),
      ],
    );
  }

  /// Widget for displaying rocket first flight and cost per launch.
  Widget _buildRocketLaunchInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTextRow(
                imagePath: 'assets/images/ship_launch.svg',
                text:
                    'First flight was in ${_extractYearFromDate(rocket.firstFlight)}',
              ),
              SizedBox(height: 10.h),
              IconTextRow(
                imagePath: 'assets/icons/rocket_cost.svg',
                text: 'Launch Cost: ${rocket.costPerLaunch} \$',
              ),
            ],
          ),
        ),
        SizedBox(width: 30.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSuccessRate(),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () => launchURLBrowser(rocket.wikipedia ?? ''),
                child: const IconTextRow(
                  imagePath: 'assets/icons/link.svg',
                  text: 'See Article',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Widget for displaying the rocket success rate.
  Widget _buildSuccessRate() {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.check,
              color: AppColors.lightGrey,
              size: 20,
            ),
            const SizedBox(width: 5.0),
            Text(
              "Success Rate: ${rocket.successRatePct} %",
              style: TextStyles.font12White700w
                  .copyWith(color: AppColors.lightGrey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRocketImage(),
        SizedBox(height: 5.h),
        _buildRocketInfo(),
        SizedBox(height: 25.h),
        _buildRocketDetails(),
        SizedBox(height: 25.h),
        _buildRocketLaunchInfo(),
      ],
    );
  }
}
