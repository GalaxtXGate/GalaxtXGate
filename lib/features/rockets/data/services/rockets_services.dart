import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets/rockets.dart';

class RocketsService {
  final DioHelper dioHelper;

  RocketsService({required this.dioHelper});

  Future<Either<ServerFailure, List<Rockets>>> getAllRockets() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'rockets');
      return right(response.map((rocket) => Rockets.fromJson(rocket)).toList());
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
