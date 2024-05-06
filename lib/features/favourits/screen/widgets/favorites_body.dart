import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/cards/fav_card.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is GetFavoriteSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GradientGrayBackground(
              child: Column(
                children: [
                  Row(
                    children: [
                      DefultAppHeader(
                        title: 'Favorites',
                        tag: 'Favorites',
                        isFavourite: true,
                        numberOfFavorites: FavoriteCubit.favs.length.toString(),
                      ),
                    ],
                  ),
                  Expanded(
                      child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: FavoriteCubit.favs.isNotEmpty
                          ? ListView.builder(
                              itemCount: FavoriteCubit.favs.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: FavCard(
                                    addFav: FavoriteCubit.favs[i],
                                    favFunction: () {
                                      FavoriteServices().removeFav(
                                        id: FavoriteCubit.favs[i].id!,
                                      );
                                      context
                                          .read<FavoriteCubit>()
                                          .getFavorites();
                                    },
                                    icon: Icons.remove_circle_outline_outlined,
                                    noFavFunction: () {},
                                  ),
                                );
                              },
                            )
                          : SizedBox(
                              height: 300.h,
                              child: Center(
                                child: Text(
                                  "No Favs",
                                  style: TextStyles.font16White700w,
                                ),
                              ),
                            ),
                    ),
                  )),
                ],
              ),
            ),
          );
        } else {
          return GradientText(
            colors: const [
              AppColors.purple,
              AppColors.blue,
              AppColors.cyan,
            ],
            child: SpinKitWave(
              color: Colors.grey,
              size: 30.w,
            ),
          );
        }
      },
    );
  }
}
