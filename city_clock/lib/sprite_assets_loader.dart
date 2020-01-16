import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

Future<SpriteSheet> loadAssets() async {
  ImageMap _imageMap;
  SpriteSheet _spriteSheet;
  
  _imageMap = new ImageMap(rootBundle);
  await _imageMap.loadImage('assets/spritesheet.png');

  String json = await rootBundle.loadString('assets/spritesheet.json');
  _spriteSheet = new SpriteSheet(_imageMap['assets/spritesheet.png'], json);
  assert(_spriteSheet.image != null);
  return _spriteSheet;
}