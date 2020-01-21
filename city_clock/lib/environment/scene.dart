import 'dart:async';

import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:global_configuration/global_configuration.dart';

class Scene extends StatefulWidget {
  final ClockModel model;
  final ImageMap images;
  final SpriteSheet spriteSheet;
  Scene(this.model, this.images, this.spriteSheet);
  
  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      this._dateTime = DateTime.now();
      this._timer = Timer(
        Duration(minutes: 15) -
        Duration(minutes: _dateTime.minute) - 
        Duration(seconds: _dateTime.second) -
        Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sceneWidgets = new List();
    sceneWidgets.add(loadSky());
    //Add clouds
    if (widget.model.weatherString == 'cloudy' || 
        widget.model.weatherString == 'foggy' ||
        widget.model.weatherString == 'rainy' || 
        widget.model.weatherString == 'thunderstorm' ||
        widget.model.weatherString == 'snowy') {
      sceneWidgets.add(SpriteWidget(CloudyWeather(widget.images)));
    }
    sceneWidgets.add(loadCityBack());
    sceneWidgets.add(loadCityFront());
    //Add rain
    if (widget.model.weatherString == 'rainy' ||
        widget.model.weatherString == 'thunderstorm') {
      sceneWidgets.add(SpriteWidget(RainyWeather(widget.spriteSheet)));
    }
    sceneWidgets.add(loadStreet());
    sceneWidgets.add(loadSign());
    sceneWidgets.add(Clock(widget.model, widget.images));
    return Stack(
      children: sceneWidgets,
      fit: StackFit.expand
    );
  }  
}

bool isDay() {
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 30);
  return (now.isAfter(dayStart) && now.isBefore(dayEnd));
}

Widget loadSky() {
  Image sky;

  // Check if day time
  if (isDay()) {
    sky = Image(
      image: AssetImage(GlobalConfiguration().getString("skyDay")),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    sky = Image(
      image: AssetImage(GlobalConfiguration().getString("skyNight")),
      fit: BoxFit.fitWidth,
    );
  }
  return sky;
}

Widget loadCityBack() {
  Image cityBack;

  // Check if day time
  if (isDay()) {
    cityBack = Image(
      image: AssetImage(GlobalConfiguration().getString("cityBackNight")),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    cityBack = Image(
      image: AssetImage(GlobalConfiguration().getString("cityBackNight")),
      fit: BoxFit.fitWidth,
    );
  }
  return cityBack;

}
Widget loadCityFront() {
  Image cityFront;

  // Check if day time
  if (isDay()) {
    cityFront = Image(
      image: AssetImage(GlobalConfiguration().getString("cityFrontNight")),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    cityFront = Image(
      image: AssetImage(GlobalConfiguration().getString("cityFrontNight")),
      fit: BoxFit.fitWidth,
    );
  }
  return cityFront;
}
Widget loadStreet() {
  Widget street;

  // Check if day time
  if (isDay()) {
    street = Image(
      image: AssetImage(GlobalConfiguration().getString("streetNight")),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    street = Image(
      image: AssetImage(GlobalConfiguration().getString("streetNight")),
      fit: BoxFit.fitWidth,
    );
  }
  return street;
}
Widget loadSign() {
  Image sign;

  // Check if day time
  if (isDay()) {
    sign = Image(
      image: AssetImage(GlobalConfiguration().getString("signNight")),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    sign = Image(
      image: AssetImage(GlobalConfiguration().getString("signNight")),
      fit: BoxFit.fitWidth,
    );
  }
  return sign;
}