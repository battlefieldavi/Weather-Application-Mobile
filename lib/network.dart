import 'package:http/http.dart';
import 'dart:convert';
class NetworkHelper{
  NetworkHelper(this.Url);
  final String Url;
  Future getData() async{
    Response R1=await get(Url);
    String d=R1.body;
    if(R1.statusCode==200){
      var z=jsonDecode(d);
      return z;
    // print("city=$z,$z1,$z2");
      }
    else {
      print(R1.statusCode);
    }

  }
}