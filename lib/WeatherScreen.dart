import 'dart:convert';
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
  double temperature = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String,dynamic>> getCurrentWeather() async {
    try {
      String cityName = "London";
      final res = await http.get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'));
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'An unexpected error occurred!';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today\'s Weather',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.place_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather() ,
        builder: (context, snapshot) {
          print(snapshot);
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          };
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data!;
          final currentTemp = data['list'][0]['main']['temp'];
          final currentSky = data['list'][0]['weather'][0]['main'];
          final currentHumidity = data['list'][0]['main']['humidity'];
          final currentPressure = data['list'][0]['main']['pressure'];
          final currentWindSpeed = data['list'][0]['wind']['speed'];
          print(snapshot.runtimeType);
          return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
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
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "$currentTemp °K",
                            style: TextStyle(
                                fontSize: 37, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Icon(
                              currentSky == "Clouds"
                                        ? Icons.cloud
                                        : currentSky == "Rain"
                                            ? Icons.cloudy_snowing
                                            : currentSky == "Snow"
                                                ? Icons.snowing
                                                : currentSky == "Clear"
                                                    ? Icons.wb_sunny_outlined
                                                    : Icons.cloud,
                            size: 65,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "$currentSky",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "London, UK",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Weather Forecast",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i = 0; i < 5; i++)
                      Hourlyforcastitem(
                        time:DateTime.fromMillisecondsSinceEpoch((data['list'][i]['dt'])*1000).toString().substring(11, 16),
                        icon:data['list'][i]['weather'][0]['main'].toString() == "Clouds"
                                        ? Icons.cloud
                                        : data['list'][i]['weather'][0]['main'].toString() == "Rain"
                                            ? Icons.cloudy_snowing
                                            : data['list'][i]['weather'][0]['main'].toString() == "Snow"
                                                ? Icons.snowing
                                                : data['list'][i]['weather'][0]['main'].toString() == "Clear"
                                                    ? Icons.wb_sunny_outlined
                                                    : Icons.cloud,
                        temp: data['list'][i]['main']['temp'].toString(),
                        
                      )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
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
                            child: Column(children: [
                              Icon(
                                Icons.water_drop_outlined,
                                size: 65,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$currentHumidity %",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Card(
                        elevation: 6,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Icon(
                                Icons.air_outlined,
                                size: 65,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Wind Speed",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$currentWindSpeed km/h",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Card(
                        elevation: 6,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Icon(
                                Icons.beach_access,
                                size: 65,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$currentPressure hPa",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        },
      ),
    );
  }
}

// Moved outside the State class here
class Hourlyforcastitem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const Hourlyforcastitem({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 130,
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                time,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Icon(
                icon,
                size: 65,
              ),
              const SizedBox(height: 10),
              Text(
                temp,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
