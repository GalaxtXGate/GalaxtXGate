import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

abstract interface class RocketsService {
  Future<List<RocketsModel>> getAllRockets();
}

class RocketsServiceImp implements RocketsService {
  final DioHelper dioHelper;
  RocketsServiceImp({required this.dioHelper});

  @override
  Future<List<RocketsModel>> getAllRockets() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'rockets');
      return response.map((rocket) => RocketsModel.fromJson(rocket)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(dioException: e);
      }
      throw ServerFailure(errMessage: "Something went wrong!");
    }
  }
}