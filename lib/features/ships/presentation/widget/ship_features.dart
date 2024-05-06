import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/widgets/icon_text_row.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ShipFeatures extends StatelessWidget {
  final ShipsModel ship;

  const ShipFeatures({super.key, required this.ship});

  _launchURLBrowser(String shipLink) async {
    if (!shipLink.startsWith('http://') && !shipLink.startsWith('https://')) {
      // Add 'https://' protocol if missing
      shipLink = 'https://$shipLink';
    }

    var url = Uri.parse(shipLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Ship launch, and port home
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextRow(
              imagePath: 'assets/images/ship_launch.svg',
              text: ship.launches!.length == 1
                  ? '${ship.launches!.length} Launch'
                  : '${ship.launches!.length} Launches',
            ),
            IconTextRow(
              imagePath: 'assets/images/ship_port_home.svg',
              text: '${ship.homePort}',
            ),
          ],
        ),
        // Ship link article, and role
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _launchURLBrowser("${ship.link}"),
              child: const IconTextRow(
                imagePath: 'assets/images/link.svg',
                text: 'See Article',
              ),
            ),
            IconTextRow(
              imagePath: 'assets/images/ship_role.svg',
              text: ship.roles![0],
            ),
          ],
        ),
      ],
    );
  }
}
