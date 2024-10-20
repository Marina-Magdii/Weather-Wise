import 'package:dartz/dartz.dart';
import 'package:weather_wise/Features/Home/data/models/ResponseModel.dart';

abstract class Dao {
  Future<Either<ResponseModel,String>>getWeather(String cityName);
}