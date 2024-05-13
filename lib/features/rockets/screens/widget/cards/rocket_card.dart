import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_button.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/rocket_details_screen.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets/rockets.dart';

class RocketCard extends StatefulWidget {
  final Rockets rocket;

  const RocketCard({super.key, required this.rocket});

  @override
  State<RocketCard> createState() => _RocketCardState();
}

class _RocketCardState extends State<RocketCard> {
  ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.deepGrey,
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: '${widget.rocket.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        height: 70.h,
                        width: 70.w,
                        fit: BoxFit.cover,
                        imageUrl: widget.rocket.flickrImages![0],
                        errorWidget: (context, url, error) => const Center(
                          child:
                              Icon(Icons.error_outline, color: AppColors.white),
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
                          "${widget.rocket.name}",
                          style: TextStyles.font16White700w.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: isExpanded,
                          builder: (BuildContext context, bool value,
                                  Widget? child) =>
                              Text(
                            "${widget.rocket.description}",
                            style: TextStyles.font12White700w.copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColors.lightGrey,
                            ),
                            maxLines: value ? 30 : 2,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                    child: ValueListenableBuilder(
                      valueListenable: isExpanded,
                      builder:
                          (BuildContext context, bool value, Widget? child) =>
                              Icon(
                        value ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: AppColors.white,
                        size: 20.w,
                      ),
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: isExpanded,
                builder: (BuildContext context, bool value, Widget? child) =>
                    Row(
                  children: [
                    value ? SizedBox(height: 55.h) : const SizedBox(),
                  ],
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
                  isExpanded.value = !isExpanded.value;
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          right: 10.w,
          child: ValueListenableBuilder(
            valueListenable: isExpanded,
            builder: (BuildContext context, bool value, Widget? child) => Row(
              children: [
                value
                    ? SizedBox(
                        height: 35.h,
                        child: EditGradientButton(
                          onPressed: () {
                            isExpanded.value = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RocketDetailsScreen(
                                  rocket: widget.rocket,
                                ),
                              ),
                            );
                          },
                          title: 'knew_more'.tr(context),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
