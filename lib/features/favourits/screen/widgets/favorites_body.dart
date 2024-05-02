import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/content_of_favorites.dart';

class FavoritesBody extends StatelessWidget {
  FavoritesBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "Favorites",
                style: TextStyles.textStyle16400
                    .copyWith(fontFamily: 'SpaceGrotesk', fontSize: 20),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 13,
                backgroundColor: AppColors.red,
                child: Text(
                  "3",
                  style: TextStyles.textStyle16400,
                ),
              )
            ],
          ),
          leading: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 90),
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: ContentOfFavorites(),
              );
            },
          ),
        ),
      ),
    );
  }
}
