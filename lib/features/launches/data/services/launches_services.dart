import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/launches/data/models/launches/launches.dart';

class LaunchesServices {
  LaunchesServices({
    required DioHelper dioHelper,
  }) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  Future<Either<ServerFailure, List<Launche>>> getLaunches() async {
    try {
      List<dynamic> data = await _dioHelper.getRequest(
        endPoint: 'launches',
      );
      List<Launche> launches = [];
      for (var element in data) {
        launches.add(Launche.fromJson(element));
      }

      return right(launches);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    }
  }
}
