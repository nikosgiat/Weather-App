import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project01/main_components/fonts.dart';
import 'package:weather/weather.dart';

class WeatherNowScreen extends StatefulWidget {
  final String cityName;
  final Weather today;
  final List<Weather> forecast;

  const WeatherNowScreen(
      {super.key,
      required this.today,
      required this.cityName,
      required this.forecast});

  @override
  State<WeatherNowScreen> createState() => _WeatherNowScreenState();
}

class _WeatherNowScreenState extends State<WeatherNowScreen> {
  bool isDay = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDay ? Colors.blue.shade200 : Colors.blueGrey.shade900,
      appBar: AppBar(
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: Colors.white,size: 30),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
        child: Column(
          children: [
            Center(
              child: Text(widget.today.areaName!,
                  style: kStyleMyWhite40600, textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                  '${widget.today.temperature?.celsius?.toStringAsFixed(0)}',
                  style: kStyleMyWhite250900,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 1.h,
            ),
            Center(
              child: // Image.asset('assets/${widget.today.weatherIcon}.gif'),
              Image.network('https://openweathermap.org/img/wn/${widget.today.weatherIcon}@2x.png')
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                widget.today.weatherDescription ?? 'Δεν έχω δεδομένα',
                style: kStyleMyWhite20400,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 160.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return CustomWeatherCard(
                    widget: widget,
                    temperature: widget.forecast[index].temperature?.celsius
                            ?.toStringAsFixed(0) ??
                        '--',
                    hour: widget.forecast[index].date
                        .toString()
                        .substring(11, 16),
                    icon: widget.forecast[index].weatherIcon ?? '--',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomWeatherCard extends StatelessWidget {
  final String temperature;
  final String hour;
  final String icon;

  const CustomWeatherCard({
    super.key,
    required this.widget,
    required this.temperature,
    required this.hour,
    required this.icon,
  });

  final WeatherNowScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      alignment: Alignment.center,
      child: Column(
        children: [
          //Image.asset('assets/$icon.gif'),
          Image.network('https://openweathermap.org/img/wn/$icon.png'),
          SizedBox(height: 5.h),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: temperature,
              style: kStyleMyWhite30600,
              children: <InlineSpan>[
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Text(
                    '°C',
                    style: kStyleMyWhite20400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            hour,
            style: kStyleMyWhite20400,
          ),
        ],
      ),
    );
  }
}
