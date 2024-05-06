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

class FavCard extends StatefulWidget {
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
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  ValueNotifier<bool> isTapped = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  child: widget.addFav.image != null
                      ? DefultAppCachedNetworkImage(
                          height: 65.w,
                          width: 65.w,
                          url: widget.addFav.image!,
                          fit: (widget.addFav.category != "Launches")
                              ? BoxFit.cover
                              : BoxFit.contain,
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
                      if (widget.addFav.category != "Crew")
                        GradientText(
                          colors: const [
                            AppColors.purple,
                            AppColors.blue,
                            AppColors.cyan,
                          ],
                          child: Text(
                            widget.addFav.category ?? "No Category",
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.addFav.name ?? "No name",
                        style: TextStyles.textStyle16400,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (widget.addFav.category != "Crew")
                        ValueListenableBuilder(
                          valueListenable: isTapped,
                          builder: (BuildContext context, bool value,
                                  Widget? child) =>
                              SizedBox(
                            width: 250,
                            child: Text(
                              widget.addFav.description ?? "No Details",
                              style: TextStyles.textStyle12400,
                              maxLines: value ? 30 : 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      if (widget.addFav.category == "Crew")
                        IconTextRow(
                          imagePath:
                              getImagePathForStatus(widget.addFav.status!),
                          text: widget.addFav.status!,
                        ),
                      if (widget.addFav.category == "Crew")
                        IconTextRow(
                          imagePath: 'assets/images/launch.svg',
                          text: widget.addFav.launchNum == "1"
                              ? '${widget.addFav.launchNum} Launch'
                              : '${widget.addFav.launchNum} Launches',
                        ),
                      // Display agency
                      if (widget.addFav.category == "Crew")
                        IconTextRow(
                          imagePath: 'assets/images/agency.svg',
                          text: widget.addFav.org ?? "No Org",
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  isTapped.value = !isTapped.value;
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 5.w,
          right: 5.w,
          child: FavoriteIcon(
            isFavourite: true,
            favFunction: widget.favFunction,
            noFavFunction: widget.noFavFunction,
            icon: widget.icon,
          ),
        )
      ],
    );
  }
}
