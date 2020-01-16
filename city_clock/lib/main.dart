import 'dart:async';
import 'dart:ui' as ui;

import 'package:city_clock/clock_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ImageMap _imageMap;
  SpriteSheet _spriteSheet;
  
  _imageMap = new ImageMap(rootBundle);
  await _imageMap.load(<String>[
    'assets/spritesheet.png',
  ]);

  String json = await rootBundle.loadString('assets/spritesheet.json');
  _spriteSheet = new SpriteSheet(_imageMap['assets/spritesheet.png'], json);

  assert(_spriteSheet.image != null);
  runApp(ClockCustomizer((ClockModel model) => ClockText(model, _spriteSheet)));
}