part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
class LoadingWeather extends WeatherState{}
class SuccessWeather extends WeatherState{
  ResponseEntity entity;
  SuccessWeather(this.entity);
}
class ErrorWeather extends WeatherState{
  String error;
  ErrorWeather(this.error);
}