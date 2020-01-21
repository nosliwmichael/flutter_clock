import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:global_configuration/global_configuration.dart';

Future<SpriteSheet> loadSpriteSheet() async {
  ImageMap _imageMap = new ImageMap(rootBundle);
  await _imageMap.loadImage(GlobalConfiguration().getString("spriteSheet"));

  String json = await rootBundle.loadString(GlobalConfiguration().getString("spriteSheetJson"));
  SpriteSheet _spriteSheet = new SpriteSheet(_imageMap[GlobalConfiguration().getString("spriteSheet")], json);

  assert(_spriteSheet.image != null);
  return _spriteSheet;
}

Future<ImageMap> loadWeatherImages() async {
  ImageMap _imageMap = new ImageMap(rootBundle);
  await _imageMap.load(<String>[
    GlobalConfiguration().getString("cloud0"),
    GlobalConfiguration().getString("cloud1"),
  ]);
  return _imageMap;
}