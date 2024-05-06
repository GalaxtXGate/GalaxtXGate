import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/rocket_details_screen.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

class RocketCard extends StatelessWidget {
  final RocketsModel rocket;

  const RocketCard({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 95.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.deepGrey,
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: '${rocket.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    height: 70.h,
                    width: 70.w,
                    fit: BoxFit.cover,
                    imageUrl: rocket.flickrImages![0],
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error_outline, color: AppColors.white),
                    ),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const CupertinoActivityIndicator(),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 170.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${rocket.name}",
                      style: TextStyles.font16White700w.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "${rocket.description}",
                      style: TextStyles.font12White700w.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.lightGrey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.w,
                  ),
                ),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.white,
                  size: 20.w,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RocketDetailsScreen(rocket: rocket),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
