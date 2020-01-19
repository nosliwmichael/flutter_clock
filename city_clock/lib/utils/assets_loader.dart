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