import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:global_configuration/global_configuration.dart';

class ClockText extends StatelessWidget {
  final ClockModel model;
  final DateTime dateTime;
  final fontStyle = TextStyle(
    fontFamily: 'Pixel_Text',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 14, 62, 110),
  );
  final _hour1, _hour2,_minute1,_minute2, _second, _weather, _temp, _location, _weekday;
  ClockText(this.model, this.dateTime):
      _hour1 = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime)[0],
      _hour2 = DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime)[1],
      _minute1 = DateFormat('mm').format(dateTime)[0],
      _minute2 = DateFormat('mm').format(dateTime)[1],
      _second = DateFormat('ss').format(dateTime),
      _weather = model.weatherString,
      _temp = model.temperatureString,
      _location = model.location,
      _weekday = DateFormat('E').format(dateTime);

  Widget loadTimeImages(hour_1,hour_2,minute_1,minute_2) {
    Image image;
    List<Widget> timeList = new List();
    //Fetch and add Hour1 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('hour1-$hour_1')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Hour2 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('hour2-$hour_2')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Minute1 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('minute1-$minute_1')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Minute2 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('minute2-$minute_2')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    return Stack(
        children: timeList,
        fit: StackFit.expand
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final dpr = MediaQuery.of(context).devicePixelRatio;
    return Positioned(
      top: h / 3,
      left: w * .5575,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 0, 255, 255),
            ),
            child: Text(
              '$_hour1$_hour2:$_minute1$_minute2',
              style: fontStyle,
              semanticsLabel:
                  'The time is $_hour1$_hour2 hours, $_minute1$_minute2 minutes.',
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
