import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/scene_layers.dart';
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