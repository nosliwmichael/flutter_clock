import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:global_configuration/global_configuration.dart';

class Scene extends StatelessWidget {
  final ClockModel model;
  final ImageMap images;
  final SpriteSheet spriteSheet;
  Scene(this.model, this.images, this.spriteSheet);

  @override
  Widget build(BuildContext context) {
    List<Widget> sceneWidgets = new List();
    sceneWidgets.add(loadSky());
    //Add clouds
    if (model.weatherString == 'cloudy' || 
        model.weatherString == 'foggy' ||
        model.weatherString == 'rainy' || 
        model.weatherString == 'thunderstorm' ||
        model.weatherString == 'snowy') {
      sceneWidgets.add(SpriteWidget(CloudyWeather(images)));
    }
    sceneWidgets.add(loadCityBack());
    sceneWidgets.add(loadCityFront());
    //Add rain
    if (model.weatherString == 'rainy' ||
        model.weatherString == 'thunderstorm') {
      sceneWidgets.add(SpriteWidget(RainyWeather(spriteSheet)));
    }
    sceneWidgets.add(loadStreet());
    sceneWidgets.add(loadSign());
    sceneWidgets.add(Clock(model, images));
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