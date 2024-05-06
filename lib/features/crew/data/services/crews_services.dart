import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';

class CrewService {
  final DioHelper dioHelper;

  CrewService({required this.dioHelper});

  Future<Either<ServerFailure, List<CrewModel>>> getAllCrews() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'crew');
      return right(response.map((crew) => CrewModel.fromJson(crew)).toList());
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
