import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';
import 'package:galaxyxgate/features/crew/data/services/crews_services.dart';
import 'package:dartz/dartz.dart';

class CrewRepository {
  final CrewService _crewService;

  CrewRepository({required CrewService crewService})
      : _crewService = crewService;

  Future<Either<ServerFailure, List<CrewModel>>> getAllCrew() async {
    try {
      final crews = await _crewService.getAllCrews();
      return Right(crews);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: "An error occurred while fetching data."));
    }
  }
}
