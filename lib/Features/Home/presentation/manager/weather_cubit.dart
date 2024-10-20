import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_wise/Features/Home/domain/entities/ResponseEntity.dart';
import 'package:weather_wise/Features/Home/domain/use_cases/Usecase.dart';
part 'weather_state.dart';
@injectable
class WeatherCubit extends Cubit<WeatherState> {
  ResponseEntity? entity;
  @factoryMethod
  WeatherCubit(this.usecase) : super(WeatherInitial());
  Usecase usecase;
  getWeather(String cityName)async{
    emit(LoadingWeather());
    var result = await usecase.call(cityName);
    result.fold(
            (response) {
              if(response.error!=null){
                emit(ErrorWeather(response.error!.message!));
              }
              else{
                entity=response;
                emit(SuccessWeather(response));
              }
        },
            (error) {
              emit(ErrorWeather(error));
            });
  }
  static WeatherCubit get(context)=> BlocProvider.of(context);
}
