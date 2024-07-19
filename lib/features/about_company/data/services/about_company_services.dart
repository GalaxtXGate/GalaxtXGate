import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/models/company_info/company_info.dart';

class AboutCompanyServices {
  AboutCompanyServices({
    required DioHelper dioHelper,
  }) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  Future<Either<ServerFailure, CompanyInfo>> getCompanyData() async {
    try {
      Map<String, dynamic> data = await _dioHelper.getRequest(
        endPoint: 'company',
      );

      return right(CompanyInfo.fromJson(data));
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
