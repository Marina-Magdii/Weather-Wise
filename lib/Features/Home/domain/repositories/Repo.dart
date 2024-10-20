import 'package:dartz/dartz.dart';
import 'package:weather_wise/Features/Home/domain/entities/ResponseEntity.dart';

abstract class Repo {
  Future<Either<ResponseEntity,String>> getWeather(String cityName);
}