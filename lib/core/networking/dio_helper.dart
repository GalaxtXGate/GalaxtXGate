import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/networking/apis_constant.dart';

class DioHelper {
  late Dio _dio;
  DioHelper({Dio? dio}) {
    if (dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApisConstants.mainUrl,
        ),
      );
    } else {
      _dio = dio;
    }
  }

  /// http get request
  dynamic getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Map<String, dynamic>? headers;

    if (token != null) {
      headers = {'Authorization': 'Bearer $token'};
    }
    Response response = await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  ///http post request
  Future<Map<String, dynamic>> postRequest({
    required Object body,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response = await _dio.post(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  ///http patch request

  Future<Map<String, dynamic>> patchRequest({
    required Object body,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response = await _dio.patch(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
