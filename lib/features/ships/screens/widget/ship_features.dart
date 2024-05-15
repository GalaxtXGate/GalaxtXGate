import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/function/launch_url_browser.dart';
import 'package:galaxyxgate/core/widgets/rows/icon_text_row.dart';
import 'package:galaxyxgate/features/ships/data/models/ships.dart';

class ShipFeatures extends StatelessWidget {
  final Ships ship;

  const ShipFeatures({super.key, required this.ship});

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
              imagePath: 'assets/icons/ship_launch.svg',
              text: ship.launches!.length == 1
                  ? '${ship.launches!.length} Launch'
                  : '${ship.launches!.length} Launches',
            ),
            IconTextRow(
              imagePath: 'assets/icons/ship_port_home.svg',
              text: '${ship.homePort}',
            ),
          ],
        ),
        // Ship link article, and role
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => launchURLBrowser("${ship.link}"),
              child: const IconTextRow(
                imagePath: 'assets/icons/link.svg',
                text: 'See Article',
              ),
            ),
            IconTextRow(
              imagePath: 'assets/icons/ship_role.svg',
              text: ship.roles![0],
            ),
          ],
        ),
      ],
    );
  }
}
