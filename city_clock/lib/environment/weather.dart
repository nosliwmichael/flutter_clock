// For the different weathers we are displaying different gradient backgrounds,
// these are the colors for top and bottom.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

const List<Color> _kBackgroundColorsTop = const <Color>[
  const Color(0xff5ebbd5),
  const Color(0xff0b2734),
  const Color(0xffcbced7)
];

const List<Color> _kBackgroundColorsBottom = const <Color>[
  const Color(0xff4aaafb),
  const Color(0xff4c5471),
  const Color(0xffe0e3ec)
];
class Weather extends NodeWithSize {
  Weather(images): super(const Size(800,480)) {
    // Start by adding a background.
    _background = new GradientNode(
      this.size,
      _kBackgroundColorsTop[1],
      _kBackgroundColorsBottom[1],
    );
    addChild(_background);

    // Then three layers of clouds, that will be scrolled in parallax.
    _cloudsSharp = new CloudLayer(
        image: images['assets/images/clouds-0.png'],
        rotated: false,
        dark: false,
        loopTime: 20.0
    );
    addChild(_cloudsSharp);

    _cloudsDark = new CloudLayer(
        image: images['assets/images/clouds-1.png'],
        rotated: true,
        dark: true,
        loopTime: 40.0
    );
    addChild(_cloudsDark);

    _cloudsSoft = new CloudLayer(
        image: images['assets/images/clouds-1.png'],
        rotated: false,
        dark: false,
        loopTime: 60.0
    );
    addChild(_cloudsSoft);
  }

  GradientNode _background;
  CloudLayer _cloudsSharp;
  CloudLayer _cloudsSoft;
  CloudLayer _cloudsDark;
}

// The GradientNode performs custom drawing to draw a gradient background.
class GradientNode extends NodeWithSize {
  GradientNode(Size size, this.colorTop, this.colorBottom) : super(size);

  Color colorTop;
  Color colorBottom;

  @override
  void paint(Canvas canvas) {
    applyTransformForPivot(canvas);

    Rect rect = Offset.zero & size;
    Paint gradientPaint = new Paint()..shader = new LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[colorTop, colorBottom],
        stops: <double>[0.0, 1.0]
    ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);
  }
}

// Draws and animates a cloud layer using two sprites.
class CloudLayer extends Node {
  CloudLayer({ ui.Image image, bool dark, bool rotated, double loopTime }) {
    // Creates and positions the two cloud sprites.
    _sprites.add(_createSprite(image, dark, rotated));
    _sprites[0].position = const Offset(1024.0, 1024.0);
    addChild(_sprites[0]);

    _sprites.add(_createSprite(image, dark, rotated));
    _sprites[1].position = const Offset(3072.0, 1024.0);
    addChild(_sprites[1]);

    // Animates the clouds across the screen.
    motions.run(new MotionRepeatForever(
        new MotionTween<Offset>(
                (a) => position = a,
            Offset.zero,
            const Offset(-2048.0, 0.0),
            loopTime)
    ));
  }

  List<Sprite> _sprites = <Sprite>[];

  Sprite _createSprite(ui.Image image, bool dark, bool rotated) {
    Sprite sprite = new Sprite.fromImage(image);

    if (rotated)
      sprite.scaleX = -1.0;

    if (dark) {
      sprite.colorOverlay = const Color(0xff000000);
      sprite.opacity = 0.0;
    }

    return sprite;
  }

  set active(bool active) {
    // Toggle visibility of the cloud layer
    double opacity;
    if (active) opacity = 1.0;
    else opacity = 0.0;

    for (Sprite sprite in _sprites) {
      sprite.motions.stopAll();
      sprite.motions.run(new MotionTween<double>(
              (a) => sprite.opacity = a,
          sprite.opacity,
          opacity,
          1.0
      ));
    }
  }
}