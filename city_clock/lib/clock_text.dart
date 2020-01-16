import 'dart:async';

import 'package:city_clock/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:spritewidget/spritewidget.dart';

class ClockText extends StatefulWidget {
  ClockText(this.model, this._spritesheet);

  final ClockModel model;
  final SpriteSheet _spritesheet;
  final List<String> textures = [
    'RunRight01.png',
    'RunRight02.png',
    'RunRight03.png',
    'RunRight04.png',
  ];

  @override
  _ClockTextState createState() => _ClockTextState();
}

class _ClockTextState extends State<ClockText> {
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
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final second = DateFormat('ss').format(_dateTime);

    return Container(
      child: Stack(
        children: <Widget>[
          new Text('$hour:$minute:$second'),
          new Positioned(
            left: 0,
            top: 0,
            child: new TextureImage(
              texture: widget._spritesheet[widget.textures[texture]],
              width: 100.0,
              height: 100.0
            ),
          ),
        ]
      ),
    );
  }
  
}