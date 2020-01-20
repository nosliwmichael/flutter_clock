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
    if (model.weatherString == 'cloudy' || 
        model.weatherString == 'foggy' ||
        model.weatherString == 'rainy' || 
        model.weatherString == 'thunderstorm' ||
        model.weatherString == 'snowy') {
      sceneWidgets.add(SpriteWidget(CloudyWeather(images)));
    }
//    sceneWidgets.add(loadSign(images));
//      image: AssetImage('assets/images/buildings2.png'),
//      fit: BoxFit.cover,
//    ));
//    if (model.weatherString == 'rainy' ||
//        model.weatherString == 'thunderstorm') {
//      sceneWidgets.add(SpriteWidget(RainyWeather(spriteSheet)));
//    }
//    sceneWidgets.add(Image(
//      image: AssetImage('assets/images/tower.png'),
//      fit: BoxFit.cover,
//    ));
    sceneWidgets.add(loadCityBack(images));
    sceneWidgets.add(loadCityFront(images));
    sceneWidgets.add(loadStreet(images));
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

}
Widget loadCityFront(ImageMap images) {

}
Widget loadStreet(ImageMap images) {

}
Widget loadSign(ImageMap images) {

}