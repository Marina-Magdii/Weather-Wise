import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_wise/Core/Constants.dart';
@singleton
class ApiManager {
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true
    ));
  }
  Future<Response> getWeather(String cityName) async {
    var response = await dio.get(
      Constants.baseUrl,queryParameters: {
      "key" : Constants.apiKey,
      "q" : cityName
    }
    );
    return response;
  }
}