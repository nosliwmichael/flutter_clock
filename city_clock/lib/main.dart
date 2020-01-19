import 'package:city_clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/widgets.dart';

main() => runApp(ClockCustomizer((ClockModel model) => Clock(model)));