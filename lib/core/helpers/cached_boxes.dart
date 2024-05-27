import 'package:hive/hive.dart';

import '../../features/ships/data/models/ships.dart';

class Boxes
{
  static Box<List<Ships>>getShips()=>Hive.box<List<Ships>>('Ships');
}