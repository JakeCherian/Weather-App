import 'package:currency_converter/WeatherScreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home:const WeatherScreen(),
    );
  }
}