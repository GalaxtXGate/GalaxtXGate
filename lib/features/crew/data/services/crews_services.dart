import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';

abstract interface class CrewService {
  Future<List<CrewModel>> getAllCrews();
}

class CrewServiceImp implements CrewService {
  final DioHelper dioHelper;
  CrewServiceImp({required this.dioHelper});

  @override
  Future<List<CrewModel>> getAllCrews() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'crew');
      return response.map((crew) => CrewModel.fromJson(crew)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(dioException: e);
      }
      throw ServerFailure(errMessage: "Something went wrong!");
    }
  }
}
