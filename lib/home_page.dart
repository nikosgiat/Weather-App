import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project01/weather_now.dart';
import 'package:weather/weather.dart';
import 'main_components/connections.dart';
import 'main_components/fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _suggestions = [];
  final String? _apiKey = dotenv.env['WEATHER_API_KEY'];

  void _searchCity(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    try {
      final url = Uri.parse(
          'http://api.openweathermap.org/geo/1.0/direct?q=$query&limit=3&appid=$_apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _suggestions = data.map((item) {
            final cityName = item['name'] as String;
            final countryName = item['country'] as String;
            return {'city': cityName, 'country': countryName};
          }).toList();
        });
      } else {
        setState(() {
          _suggestions = [];
        });
      }
    } catch (e) {
      print("Error fetching city data: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Discover',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed(
                  textStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'the weather in..',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed(
                  textStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              TextField(
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                controller: _controller,
                onChanged: _searchCity,
                decoration: InputDecoration(
                  hintText: 'Search city...',
                  prefixIcon: InkWell(
                    onTap: () {
                      if (_controller.text != '') {
                        _controller.clear();
                        setState(() {
                          _suggestions = [];
                        });
                      }
                    },
                    child: Icon(
                      _controller.text == '' ? Icons.search : Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  final city = _suggestions[index]['city'] ?? 'Unknown City';
                  final country =
                      _suggestions[index]['country'] ?? 'Unknown Country';
                  return Container(
                    key: ValueKey(city),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: ListTile(
                      title: Text(
                        '$city, $country',
                        style: kStyleMyWhite25600,
                      ),
                      onTap: () async {
                        setState(() {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                        });
                        Weather today = await wf.currentWeatherByCityName(city);
                        List<Weather> forecast =
                            await wf.fiveDayForecastByCityName(city);

                        Get.to(WeatherNowScreen(
                            cityName: city, today: today, forecast: forecast));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
