import 'ErrorEntity.dart';
import 'LocationEntity.dart';
import 'CurrentEntity.dart';

class ResponseEntity {
  ResponseEntity({
      this.error, 
      this.location, 
      this.current,});
  ErrorEntity? error;
  LocationEntity? location;
  CurrentEntity? current;

}