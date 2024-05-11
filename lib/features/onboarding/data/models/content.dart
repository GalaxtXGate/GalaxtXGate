import 'package:flutter/widgets.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/utils/app_animations.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';

class Content {
  String image;
  String text;
  String title;
  String subTitle;
  Content(
      {required this.image,
      required this.text,
      required this.title,
      required this.subTitle});
}

List<Content> getContent(BuildContext context) {
  return [
    Content(
        image: AppAnimations.moon,
        text: AppStrings.welcomeTo.tr(context),
        title: AppStrings.galaxyXGate.tr(context),
        subTitle:
            AppStrings.yourGuideToKnowingAllAboutSpaceXLaunches.tr(context)),
    Content(
      image: AppAnimations.galaxy,
      text: AppStrings.weProvide.tr(context),
      title: AppStrings.reliableInformation.tr(context),
      subTitle: AppStrings.beUpdatedWithAllTheRocketsCapsulesCrew.tr(context),
    ),
  ];
}