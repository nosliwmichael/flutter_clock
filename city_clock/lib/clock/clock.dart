import 'dart:async';
import 'package:city_clock/clock/clock_text.dart';
import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter_clock_helper/model.dart';

class Clock extends StatefulWidget {
  Clock(this.model, this.images);

  final ClockModel model;
  final ImageMap images;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  
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
        Duration(milliseconds: 500) -
        Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClockText(widget.model, _dateTime),
        ]
      ),
    );
  }
  
}