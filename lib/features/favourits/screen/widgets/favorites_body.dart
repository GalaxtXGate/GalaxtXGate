import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/content_of_favorites.dart';
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
                        numberOfFavorites: context
                            .read<FavoriteCubit>()
                            .favoriteList
                            .length
                            .toString(),
                      ),
                    ],
                  ),
                  Expanded(
                      child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: ListView.builder(
                        itemCount:
                            context.read<FavoriteCubit>().favoriteList.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: ContentOfFavorites(
                              Title:
                                  "${context.read<FavoriteCubit>().favoriteList[i]['title']}",
                              Name:
                                  "${context.read<FavoriteCubit>().favoriteList[i]['name']} ",
                              Description:
                                  "${context.read<FavoriteCubit>().favoriteList[i]['description']}",
                              image:
                                  "${context.read<FavoriteCubit>().favoriteList[i]['image']}",
                              
                              onPressed: () {
                                FavoriteServices().removeFav(
                                    id: context
                                        .read<FavoriteCubit>()
                                        .favoriteList[i]
                                        .id);
                                if (i != 0) {
                                  context
                                      .read<FavoriteCubit>()
                                      .favoriteList
                                      .length--;
                                }
                                context.read<FavoriteCubit>().getFavorite();
                                
                              }, icon: Icons.remove_circle_outline_outlined,
                            ),
                          );
                        },
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
