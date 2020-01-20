import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';

class ClockText extends StatelessWidget {
  final ClockModel model;
  final DateTime dateTime;
  final fontStyle = TextStyle(
    fontFamily: 'Pixel_Text',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 14, 62, 110),
  );
  final _hour, _minute, _second, _weather, _temp, _location, _weekday;
  ClockText(this.model, this.dateTime):
      _hour = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime),
      _minute = DateFormat('mm').format(dateTime),
      _second = DateFormat('ss').format(dateTime),
      _weather = model.weatherString,
      _temp = model.temperatureString,
      _location = model.location,
      _weekday = DateFormat('E').format(dateTime);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height - 110,
      left: MediaQuery.of(context).size.width - 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 0, 255, 255),
            ),
            child: Text(
              '$_hour:$_minute',
              style: fontStyle,
              semanticsLabel:
                  'The time is $_hour hours, $_minute minutes.',
            ),
          ),
          // Text(
          //   '$_weekday $_temp',
          //   style: fontStyle,
          //   semanticsLabel: 'The temperature is $_temp',
          // ),
          // Text(
          //   _weather,
          //   style: fontStyle,
          //   semanticsLabel: 'The weather is $_weather',
          // ),
          // new Container(
          //   height: 20.0,
          //   width: 110.0,
          //   // TODO: Test Semantics on physical device
          //   child: Semantics(
          //     label: 'You are located in $_location.',
          //     child: Marquee(
          //       text: _location,
          //       blankSpace: 180,
          //       style: fontStyle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
