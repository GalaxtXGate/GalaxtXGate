import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:galaxyxgate/features/ships/data/models/ships.dart';
import 'package:galaxyxgate/features/ships/data/services/ships_services.dart';

import '../services/ships_local_data_source.dart';

class ShipsRepository {
  final ShipsService _shipsService;
  final ShipsLocalDataSource shipsLocalDataSource;

  ShipsRepository({required ShipsService shipsService,required this.shipsLocalDataSource})
      : _shipsService = shipsService;

  Future<Either<ServerFailure, List<Ships>>> getAllShips() async {
    try {
      final ships = await _shipsService.getFilteredShips();
      shipsLocalDataSource.cacheShips(ships);
     List<Ships>?shipsList= shipsLocalDataSource.getCachedShips();
      return Right(ships);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: "An error occurred while fetching data."));
    }
  }
}
