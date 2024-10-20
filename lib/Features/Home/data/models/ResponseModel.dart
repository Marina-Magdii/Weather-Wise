import 'package:weather_wise/Features/Home/domain/entities/ResponseEntity.dart';

import 'Error.dart';
import 'Location.dart';
import 'Current.dart';

class ResponseModel {
  ResponseModel({
      this.error, 
      this.location, 
      this.current,});

  ResponseModel.fromJson(dynamic json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  Error? error;
  Location? location;
  Current? current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (error != null) {
      map['error'] = error?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }
ResponseEntity toResponseEntity(){
    return ResponseEntity(
      error: error?.toErrorEntity(),
      location: location?.toLocationEntity(),
      current: current?.toCurrentEntity(),
    );

}
}