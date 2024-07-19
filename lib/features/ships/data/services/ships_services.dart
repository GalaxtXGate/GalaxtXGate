import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/ships/data/models/ships.dart';

abstract interface class ShipsService {
  Future<List<Ships>> getAllShips();
  Future<List<Ships>> getFilteredShips();
}

class ShipsServiceImp implements ShipsService {
  final DioHelper dioHelper;
  ShipsServiceImp({required this.dioHelper});

  @override
  Future<List<Ships>> getAllShips() async {
    try {
      List<dynamic> response = await dioHelper.getRequest(endPoint: 'ships');
      return response.map((ship) => Ships.fromJson(ship)).toList();
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(dioException: e);
      }
      throw ServerFailure(errMessage: "Something went wrong!");
    }
  }

  @override
  Future<List<Ships>> getFilteredShips() async {
    // First, fetch all ships using the existing method
    final List<Ships> ships = await getAllShips();

    // Filter ships to include only those with non-null images
    final List<Ships> filteredShips =
        ships.where((ship) => ship.image != null).toList();

    // Return the filtered list
    return filteredShips;
  }
}
