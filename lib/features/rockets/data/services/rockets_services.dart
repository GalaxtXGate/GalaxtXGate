import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

abstract interface class RocketsService {
  Future<List<RocketsModel>> getAllCrews();
}

class RocketsServiceImp implements RocketsService {
  final DioHelper dioHelper;

  RocketsServiceImp(this.dioHelper);

  @override
  Future<List<RocketsModel>> getAllCrews() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'crew');
      return response.map((crew) => RocketsModel.fromJson(crew)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(dioException: e);
      }
      throw ServerFailure(errMessage: "Something went wrong!");
    }
  }
}
