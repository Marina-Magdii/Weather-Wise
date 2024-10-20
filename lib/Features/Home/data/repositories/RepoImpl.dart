import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_wise/Core/InternerChecker.dart';
import 'package:weather_wise/Features/Home/data/data_sources/Dao.dart';
import 'package:weather_wise/Features/Home/domain/entities/ResponseEntity.dart';
import 'package:weather_wise/Features/Home/domain/repositories/Repo.dart';
@Injectable(as : Repo)
class RepoImpl extends Repo{
  Dao apiDao;
  @factoryMethod
  RepoImpl(this.apiDao);
  @override
  Future<Either<ResponseEntity, String>> getWeather(String cityName) async{
    bool isConnected=await InternetChecker.checkNetwork();
    if(isConnected){
      var result = await apiDao.getWeather(cityName);
      return result.fold(
              (response){
                if(response.error!=null){
                  return Right(response.error!.message!);
                }
                else {
                  return Left(response.toResponseEntity());
    }
              },
              (error) {
                return Right(error);
              });
    }
    else {
      return const Right("No internet connection!");
    }
  }

}