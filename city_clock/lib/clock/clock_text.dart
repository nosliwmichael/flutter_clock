import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
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
  final _hour1, _hour2, _minute1, _minute2;
  ClockText(this.model, this.dateTime)
      : _hour1 =
            DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime)[0],
        _hour2 =
            DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(dateTime)[1],
        _minute1 = DateFormat('mm').format(dateTime)[0],
        _minute2 = DateFormat('mm').format(dateTime)[1];

  Widget loadTimeImages() {
    Image image;
    List<Widget> timeList = new List();
    //Fetch and add Hour1 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString("hour1-$_hour1")),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Hour2 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('hour2-$_hour2')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add ":" image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('colon')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Minute1 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('minute1-$_minute1')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    //Fetch and add Minute2 image
    image = Image(
      image: AssetImage(GlobalConfiguration().getString('minute2-$_minute2')),
      fit: BoxFit.fitWidth,
    );
    timeList.add(image);

    return Stack(children: timeList, fit: StackFit.expand);
  }

  @override
  Widget build(BuildContext context) {
    return loadTimeImages();
  }
}
