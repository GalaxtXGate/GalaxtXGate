import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';
import 'package:galaxyxgate/features/ships/presentation/widget/ship_card.dart';

class AnimatedShipsList extends StatelessWidget {
  final List<ShipsModel> ships;
  const AnimatedShipsList({super.key, required this.ships});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final ship = ships[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ShipCard(
                    ship: ship,
                  ),
                ),
              ),
            );
          },
          childCount: ships.length,
        ),
      ),
    );
  }
}
