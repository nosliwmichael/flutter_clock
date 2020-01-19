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
    color: Colors.white,
  );
  final hour, minute, second, weather, temp, location;
  ClockText(this.model, this.dateTime)
      : hour = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime),
        minute = DateFormat('mm').format(dateTime),
        second = DateFormat('ss').format(dateTime),
        weather = model.weatherString,
        temp = model.temperatureString,
        location = model.location;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$hour:$minute:$second',
            style: fontStyle,
            semanticsLabel:
                'The time is $hour hours, $minute minutes, and $second seconds.',
          ),
          Text(
            temp,
            style: fontStyle,
            semanticsLabel: 'The temperature is $temp',
          ),
          Text(
            weather,
            style: fontStyle,
            semanticsLabel: 'The weather is $weather',
          ),
          new Container(
            height: 80.0,
            width: 480.0,
            // TODO: Test Semantics on physical device
            child: Semantics(
              label: 'You are located in $location.',
              child: Marquee(
                text: location,
                style: fontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
