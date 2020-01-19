import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';

class ClockText extends StatelessWidget {
  final ClockModel model;
  final DateTime dateTime;
  final fontStyle = TextStyle(
    fontFamily: 'Monoton',
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final _hour, _minute, _second, _weather, _temp, _location;
  ClockText(this.model, this.dateTime):
      _hour = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime),
      _minute = DateFormat('mm').format(dateTime),
      _second = DateFormat('ss').format(dateTime),
      _weather = model.weatherString,
      _temp = model.temperatureString,
      _location = model.location;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$_hour:$_minute:$_second',
            style: fontStyle,
            semanticsLabel:
                'The time is $_hour hours, $_minute minutes, and $_second seconds.',
          ),
          Text(
            _temp,
            style: fontStyle,
            semanticsLabel: 'The temperature is $_temp',
          ),
          Text(
            _weather,
            style: fontStyle,
            semanticsLabel: 'The weather is $_weather',
          ),
          new Container(
            height: 80.0,
            width: 480.0,
            // TODO: Test Semantics on physical device
            child: Semantics(
              label: 'You are located in $_location.',
              child: Marquee(
                text: _location,
                style: fontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
