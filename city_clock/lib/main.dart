import 'package:city_clock/environment/scene.dart';
import 'package:city_clock/utils/assets_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
  ImageMap images = await loadWeatherImages();
  runApp(ClockCustomizer((ClockModel model) => Scene(model, images)));
}