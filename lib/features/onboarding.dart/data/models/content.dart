import 'package:galaxyxgate/core/themes/app_images.dart';

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
      text: "Welcome To",
      title: "Galaxy X Gate",
      subTitle: "Your guide to knowing all about \nspace X launches"),
  Content(
      image: AppImages.rocket,
      text: "We Provide",
      title: "Reliable Information",
      subTitle: "Be updated with all the Rockets, \ncapsules, crew and more"),
];
