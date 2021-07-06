import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;
  Future <void> getCurrentLocation() async//Future<void> is used for waiting for getcurrent to finish
  {
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      // print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}