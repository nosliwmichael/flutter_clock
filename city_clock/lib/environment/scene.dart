import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';

class Scene extends StatelessWidget {
  final ClockModel model;
  final ImageMap images;
  final SpriteSheet spriteSheet;
  Scene(this.model, this.images, this.spriteSheet);
  @override
  Widget build(BuildContext context) {
    List<Widget> sceneWidgets = new List();
    sceneWidgets.add(loadSky(images));
    //Add clouds
    if (model.weatherString == 'cloudy' || 
        model.weatherString == 'foggy' ||
        model.weatherString == 'rainy' || 
        model.weatherString == 'thunderstorm' ||
        model.weatherString == 'snowy') {
      sceneWidgets.add(SpriteWidget(CloudyWeather(images)));
    }
    sceneWidgets.add(loadCityBack(images));
    sceneWidgets.add(loadCityFront(images));
    //Add rain
    if (model.weatherString == 'rainy' ||
        model.weatherString == 'thunderstorm') {
      sceneWidgets.add(SpriteWidget(RainyWeather(spriteSheet)));
    }
    sceneWidgets.add(loadStreet(images));
    sceneWidgets.add(loadSign(images));
    sceneWidgets.add(Clock(model, images));
    return Stack(
      children: sceneWidgets,
    );
  }
}

Widget loadSky(ImageMap images) {
  Image sky;
  DateTime now = DateTime.now();
  DateTime dayStart = new DateTime(now.year, now.month, now.day, 6, 30);
  DateTime dayEnd = new DateTime(now.year, now.month, now.day, 18, 5);

  // Check if day time
  if (now.isAfter(dayStart) && now.isBefore(dayEnd)) {
    sky = Image(
      image: AssetImage('assets/images/skies/sky_night.png'),
      fit: BoxFit.cover,
    );
  }
  else {
    sky = Image(
      image: AssetImage('assets/images/skies/sky_night.png'),
      fit: BoxFit.cover,
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
      fit: BoxFit.cover,
    );
  }
  else {
    cityBack = Image(
      image: AssetImage('assets/images/city_back/city_back_night.png'),
      fit: BoxFit.cover,
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
      fit: BoxFit.cover,
    );
  }
  else {
    cityFront = Image(
      image: AssetImage('assets/images/city_front/city_front_night.png'),
      fit: BoxFit.cover,
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
    street = FittedBox(
      child: Image(
        image: AssetImage('assets/images/streets/street_night.png'),
      ),
      fit: BoxFit.fill,
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
      fit: BoxFit.cover,
    );
  }
  else {
    sign = Image(
      image: AssetImage('assets/images/signs/sign_night.png'),
      fit: BoxFit.cover,
    );
  }
  return sign;
}