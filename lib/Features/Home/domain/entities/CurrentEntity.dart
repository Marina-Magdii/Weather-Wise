import 'ConditionEntity.dart';

class CurrentEntity {
  CurrentEntity({
    this.lastUpdated,
    this.tempC,
    this.condition,
    this.windDegree,
    this.humidity,
    this.tempF,
    this.windKph,
    this.cloud,
    this.windDir
  });
  String? lastUpdated;
  num? tempC;
  num? windKph;
  String? windDir;
  num? tempF;
  ConditionEntity? condition;
  num? windDegree;
  num? humidity;
  num? cloud;
}
