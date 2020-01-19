import 'dart:async';
import 'package:city_clock/clock_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

class Clock extends StatefulWidget {
  Clock(this.model);

  final ClockModel model;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  int texture = 0;
  
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
  }

  void _updateTime() {
    setState(() {
      this._dateTime = DateTime.now();
      this._timer = Timer(
        // Duration(minutes: 1) -
        Duration(seconds: 1) - 
        Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      
      if (texture < 3) {
        texture++;
      } else {
        texture = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/city_scene.jpg'), 
            fit: BoxFit.cover,
          ),
          ClockText(widget.model, _dateTime),
        ]
      ),
    );
  }
  
}