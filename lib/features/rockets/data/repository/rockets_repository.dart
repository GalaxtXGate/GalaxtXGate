import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';
import 'package:galaxyxgate/features/rockets/data/services/rockets_services.dart';

class RocketsRepository {
  final RocketsService _rocketService;

  RocketsRepository({required RocketsService rocketService})
      : _rocketService = rocketService;

  Future<Either<ServerFailure, List<RocketsModel>>> getAllRockets() async {
    try {
      final rockets = await _rocketService.getAllRockets();
      return Right(rockets);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: "An error occurred while fetching data."));
    }
  }
}
