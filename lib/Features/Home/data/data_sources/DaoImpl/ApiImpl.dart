import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_wise/Core/ApiManager.dart';
import 'package:weather_wise/Features/Home/data/data_sources/Dao.dart';
import 'package:weather_wise/Features/Home/data/models/ResponseModel.dart';
@Injectable(as: Dao)
class ApiImpl extends Dao{
  ApiManager apiManager;
  @factoryMethod
  ApiImpl(this.apiManager);
  @override
  Future<Either<ResponseModel, String>> getWeather(String cityName)async {
    try{
     var response = await apiManager.getWeather(cityName);
      return Left(ResponseModel.fromJson(response.data));
    }
    catch(e){
      return Right(e.toString());
    }
  }
  
}