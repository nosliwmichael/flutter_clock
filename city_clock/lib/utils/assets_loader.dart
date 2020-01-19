import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

Future<SpriteSheet> loadSpriteSheet() async {
  ImageMap _imageMap = new ImageMap(rootBundle);
  await _imageMap.loadImage('assets/spritesheet.png');

  String json = await rootBundle.loadString('assets/spritesheet.json');
  SpriteSheet _spriteSheet = new SpriteSheet(_imageMap['assets/spritesheet.png'], json);

  assert(_spriteSheet.image != null);
  return _spriteSheet;
}

Future<ImageMap> loadWeatherImages() async {
  ImageMap _imageMap = new ImageMap(rootBundle);
  await _imageMap.load(<String>[
    'assets/images/clouds-0.png',
    'assets/images/clouds-1.png'
  ]);
  return _imageMap;
}