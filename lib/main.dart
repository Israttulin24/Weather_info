import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'RestClient.dart';
import 'WeatherModel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather CRUD APP',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClient client =WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.GetWeatherInfoRequest("Dhaka");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Weather"),
        backgroundColor: Color.fromRGBO(124,81,254,1),
        elevation: 4,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              //gradiennt color
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(81,48,167,1),
                                Color.fromRGBO(121,82,191,0.6),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 80)),
                  Text(
                      "${data!.cityName}",
                    style: TextStyle (
                      fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Updated: " + DateFormat('hh:mm a').format(DateTime.now()),
                    style: TextStyle (
                      fontSize: 24.0, color: Colors.white,
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 80)),

                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.network('http://openweathermap.org/img/w/${data!.icn}.png'),
                      Padding(padding: EdgeInsets.only(right: 20)),
                      Text(
                        "${data!.temp}\u00B0",
                        style: TextStyle (
                          fontSize: 32.0, color: Colors.white,fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(right: 20)),

                      Column(
                        children: [
                          Text(
                            "max: ${data!.mx_Temp}\u00B0",
                            style: TextStyle (
                              fontSize: 20.0, color: Colors.white,
                            ),
                          ),

                          Text(
                            "min: ${data!.mn_Temp}\u00B0",
                            style: TextStyle (
                              fontSize: 20.0, color: Colors.white,
                            ),
                          ),

                        ],
                      ),

                    ],


                  ),

                  Padding(padding: EdgeInsets.only(top: 30)),

                  Text(
                    "${data!.weather}",
                    style: TextStyle (
                      fontSize: 40.0, color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }

          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return Container();
        }

      ),


    );






  }



}