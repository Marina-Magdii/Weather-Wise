
import 'package:weather_wise/Features/Home/domain/entities/ErrorEntity.dart';

class Error {
  Error({
      this.code, 
      this.message,});

  Error.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
  }
  num? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }
ErrorEntity toErrorEntity (){
    return ErrorEntity(
      message: message
    );
}
}