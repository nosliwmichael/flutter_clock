import 'package:city_clock/environment/scene.dart';
import 'package:city_clock/utils/assets_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';

void main() async {
  // Enable widget binding before runApp is called so we can load assets
  WidgetsFlutterBinding.ensureInitialized();
  // Hide nav/status bars
  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);

  // Contains scene/environment assets
  ImageMap images = await loadWeatherImages();
  // Contains sprite/animation assets
  SpriteSheet spriteSheet = await loadSpriteSheet();

  // Start app with ClockCustomizer widget
  runApp(ClockCustomizer((ClockModel model) => Scene(model, images, spriteSheet)));
}