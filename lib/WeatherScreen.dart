import 'dart:ui';
import 'package:currency_converter/Secrets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }
  
Future getCurrentWeather() async{
  String cityName = "London ";
  final res =await http.get(
    Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey '));

    print(res.body);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Weather',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh),),
        ],
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MAIN
         Container(
          padding: const EdgeInsets.all(20.0),
           width: double.infinity,
           child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 20,
            child:BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1,sigmaY: 1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("300° K", style: TextStyle(fontSize: 37,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Icon(Icons.cloud,size: 65,),
                    const SizedBox(height: 20,),
                    Text("Cloudy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text("Kochi",style: TextStyle(fontSize: 15,),),
                  ],
                ),
              ),
            ),
           ),
         ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Weather Forecast",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),
              ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Hourlyforcastitem(
                time: "1:00 AM",
                icon: Icons.cloud,
                temp: "301.22° K",
              ),
              Hourlyforcastitem(
                time: "3:00 AM",
                icon: Icons.wb_sunny_outlined,
                temp: "300.52° K",
              ),
              Hourlyforcastitem(
                time: "6:00 AM",
                icon: Icons.cloud,
                temp: "301.22° K",  
              ),
              Hourlyforcastitem(
                time: "9:00 AM",
                icon: Icons.wb_sunny_outlined,
                temp: "304.22° K",
              ),
            ],),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Additional Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ),
           const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Row(
               children: [
                 Container(
                   width: 120,
                   child: Card(
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         children: [
                           Icon(Icons.water_drop_outlined,size: 65,),
                           const SizedBox(height: 10,),
                           Text("Humidity",style: TextStyle(fontSize: 15,) ),
                           const SizedBox(height: 10,),
                           Text("30%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                         ]
                       )
                     )
                   ),
                 ),
                 Container(
                   width: 120,
                   child: Card(
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         children: [
                           Icon(Icons.air_outlined,size: 65,),
                           const SizedBox(height: 10,),
                           Text("Wind Speed",style: TextStyle(fontSize: 15,) ),
                           const SizedBox(height: 10,),
                           Text("7.67",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                         ]
                       )
                     )
                   ),
                 ),
                Container(
                   width: 120,
                   child: Card(
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         children: [
                           Icon(Icons.beach_access,size: 65,),
                           const SizedBox(height: 10,),
                           Text("Pressure",style: TextStyle(fontSize: 15,) ),
                           const SizedBox(height: 10,),
                           Text("1006",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                         ]
                       )
                     )
                   ),
                 ),
               ],
             ),
           )
          
        ]
      )
      
    );
  }
}

class Hourlyforcastitem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const Hourlyforcastitem({super.key, required this.time, required this.icon, required this.temp});
  @override
    Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 130,
                    child: Card(
                      elevation: 6,
                      child:Padding(padding: const EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          Text(time, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Icon(icon,size: 65,),
                          const SizedBox(height: 10,),
                          Text(temp,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ]
                      )
                    ),
                  ),
                ),);
    }
  }
