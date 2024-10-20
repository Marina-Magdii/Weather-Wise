import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_wise/Features/Home/domain/repositories/Repo.dart';
import '../entities/ResponseEntity.dart';

@injectable
class Usecase {
  Repo repo;
  @factoryMethod
  Usecase(this.repo);
  Future<Either<ResponseEntity, String>>  call(String cityName)=>repo.getWeather(cityName);
}