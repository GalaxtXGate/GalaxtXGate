
import 'package:galaxyxgate/features/ships/data/models/ships.dart';
import '../../../../core/helpers/cached_boxes.dart';

abstract class ShipsLocalDataSource {
  Future<void> cacheShips(List<Ships>ships);
  List<Ships>? getCachedShips();

}

class ShipsLocalDataSourceImpl implements ShipsLocalDataSource{
  @override
  Future<void> cacheShips(List<Ships>ships) async {
    final box = Boxes.getShips();
    box.put('Ships',ships);
  }


  @override
  List<Ships>? getCachedShips() {
    final box = Boxes.getShips();
    if (box.get('Ships') == null) {
      return null;
    }
    else
      {
        List<Ships>? shipsJson = box.get('Ships');
        return shipsJson ;
      }
  }
}