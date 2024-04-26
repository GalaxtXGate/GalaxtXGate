import 'package:easy_localization/easy_localization.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
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

List<Content> content = [
  Content(
      image: AppImages.moon,
      text: AppStrings. welcomeTo.tr(),
      title: AppStrings.galaxyXGate.tr(),
      subTitle:  AppStrings.yourGuideToKnowingAllAboutSpaceXLaunches .tr()),
  Content(
      image: AppImages.rocket,
      text: AppStrings.weProvide.tr(),
      title:  AppStrings.reliableInformation.tr(),
      subTitle: AppStrings.beUpdatedWithAllTheRocketsCapsulesCrew.tr(),),
];

