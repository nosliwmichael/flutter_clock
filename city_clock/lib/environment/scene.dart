import 'package:city_clock/clock/clock.dart';
import 'package:city_clock/environment/weather.dart';
import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

class Scene extends StatelessWidget {
  final model, images;
  Scene(this.model, this.images);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        loadWeather(model.weatherString, images),
        Image(
          image: AssetImage('assets/images/buildings.png'),
          fit: BoxFit.cover,
        ),
        Clock(model, images),
      ],
    );
  }
}

Widget loadWeather(String weather, images) {
  if (weather == 'cloudy') {
    return new SpriteWidget(Weather(images));
  }
  else {
    return Image(
      image: AssetImage('assets/images/sky.jpg'),
      fit: BoxFit.cover,
    );
  }
}