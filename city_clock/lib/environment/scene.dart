import 'dart:async';

import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';

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
    sceneWidgets.add(loadSky(widget.images));
    //Add clouds
    if (widget.model.weatherString == 'cloudy' || 
        widget.model.weatherString == 'foggy' ||
        widget.model.weatherString == 'rainy' || 
        widget.model.weatherString == 'thunderstorm' ||
        widget.model.weatherString == 'snowy') {
      sceneWidgets.add(SpriteWidget(CloudyWeather(widget.images)));
    }
    sceneWidgets.add(loadCityBack(widget.images));
    sceneWidgets.add(loadCityFront(widget.images));
    //Add rain
    if (widget.model.weatherString == 'rainy' ||
        widget.model.weatherString == 'thunderstorm') {
      sceneWidgets.add(SpriteWidget(RainyWeather(widget.spriteSheet)));
    }
    sceneWidgets.add(loadStreet(widget.images));
    sceneWidgets.add(loadSign(widget.images));
    sceneWidgets.add(Clock(widget.model, widget.images));
    return Stack(
      children: sceneWidgets,
      fit: StackFit.expand
    );
  }  
}

Widget loadSky(ImageMap images) {
  Image sky;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 30);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    sky = Image(
      image: AssetImage('assets/images/skies/sky_day.png'),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    sky = Image(
      image: AssetImage('assets/images/skies/sky_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  return sky;
}

Widget loadCityBack(ImageMap images) {
  Image cityBack;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 5);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    cityBack = Image(
      image: AssetImage('assets/images/city_back/city_back_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    cityBack = Image(
      image: AssetImage('assets/images/city_back/city_back_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  return cityBack;

}
Widget loadCityFront(ImageMap images) {
  Image cityFront;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 5);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    cityFront = Image(
      image: AssetImage('assets/images/city_front/city_front_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    cityFront = Image(
      image: AssetImage('assets/images/city_front/city_front_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  return cityFront;
}
Widget loadStreet(ImageMap images) {
  Widget street;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 5);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    street = Image(
      image: AssetImage('assets/images/streets/street_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    street = Image(
      image: AssetImage('assets/images/streets/street_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  return street;
}
Widget loadSign(ImageMap images) {
  Image sign;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 5);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    sign = Image(
      image: AssetImage('assets/images/signs/sign_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  else {
    sign = Image(
      image: AssetImage('assets/images/signs/sign_night.png'),
      fit: BoxFit.fitWidth,
    );
  }
  return sign;
}