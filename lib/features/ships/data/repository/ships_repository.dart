import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:galaxyxgate/features/ships/data/models/ships.dart';
import 'package:galaxyxgate/features/ships/data/services/ships_services.dart';

class ShipsRepository {
  final ShipsService _shipsService;

  ShipsRepository({required ShipsService shipsService})
      : _shipsService = shipsService;

  Future<Either<ServerFailure, List<Ships>>> getAllShips() async {
    try {
      final ships = await _shipsService.getFilteredShips();
      return Right(ships);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: "An error occurred while fetching data."));
    }
  }
}
