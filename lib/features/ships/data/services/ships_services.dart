import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';

abstract interface class ShipsService {
  Future<List<ShipsModel>> getAllShips();
}

class ShipsServiceImp implements ShipsService {
  final DioHelper dioHelper;
  ShipsServiceImp({required this.dioHelper});

  @override
  Future<List<ShipsModel>> getAllShips() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'ships');
      return response.map((ship) => ShipsModel.fromJson(ship)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(dioException: e);
      }
      throw ServerFailure(errMessage: "Something went wrong!");
    }
  }
}
