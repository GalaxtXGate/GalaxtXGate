import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/widgets/columns/lost_page_&&_no_data_column.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/cards/fav_card.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 30.h),
            child: const DefultAppHeader(
              title: 'Favorites',
              tag: 'Favorites',
              isFavourite: true,
              canback: false,
            ),
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is GetFavoriteLoading) {
                return SizedBox(
                  height: 400.h,
                  child: Center(
                    child: GradientText(
                      colors: const [
                        AppColors.purple,
                        AppColors.blue,
                        AppColors.cyan,
                      ],
                      child: SpinKitWave(
                        color: Colors.grey,
                        size: 30.w,
                      ),
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<FavoriteCubit>().getFavorites();
                  },
                  child: FavoriteCubit.favs.isNotEmpty
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 20.w, left: 20.w, bottom: 90),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: FavoriteCubit.favs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: FavCard(
                                            addFav: FavoriteCubit.favs[index],
                                            favFunction: () {
                                              context
                                                  .read<FavoriteCubit>()
                                                  .removeOneFav(
                                                    id: FavoriteCubit
                                                        .favs[index].id!,
                                                    context: context,
                                                  );
                                            },
                                            icon: Icons
                                                .remove_circle_outline_outlined,
                                            noFavFunction: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : const LostPageAndNoDataColumn(
                          mainText: 'You haven’t added any favorites yet',
                          subText: 'Go out and explore more',
                        ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
