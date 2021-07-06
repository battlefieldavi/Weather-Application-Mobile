import 'package:flutter/material.dart';
import 'weather.dart';
import 'cityscreen.dart';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
  color: Colors.white,
);
class LocationScreen extends StatefulWidget {
  LocationScreen(this.weat1);
  final weat1;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
@override
String city;
double temp;
int temp1;
String wicon;
String msg;
WeatherModel w1=WeatherModel();


  void initState() {
    // TODO: implement initState
    super.initState();
    update(widget.weat1);
  }
  void update(dynamic data){

    setState((){temp=data["main"]['temp'];
    if(data==null)
      {
        temp1=0;
        wicon="Error";
        msg="Unable to retrieve Data";
        city="";
        return;
      }
    temp1=temp.toInt();
    city=data["name"];
    var condition=data["weather"][0]["id"];
    wicon=w1.getWeatherIcon(condition);
    msg=w1.getMessage(temp1);
    });


}
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bkg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weat=await w1.getLocationWeather();
                      update(weat);
                      print(weat);

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{

                      var z1=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                     if(z1!=null)
                       {
                         var z2=await w1.citynew(z1);
                         update(z2);
                       }
                    },

                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp1°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$wicon',
                      style: kConditionTextStyle,

                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}