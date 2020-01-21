// For the different weathers we are displaying different gradient backgrounds,
// these are the colors for top and bottom.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

class CloudyWeather extends NodeWithSize {
  CloudyWeather(this.images): super(const Size(800,480)) {
    _cloudsSharp = new CloudLayer(
        image: images['assets/images/clouds-0.png'],
        rotated: false,
        dark: false,
        loopTime: 50.0
    );
    addChild(_cloudsSharp);

    _cloudsDark = new CloudLayer(
        image: images['assets/images/clouds-1.png'],
        rotated: true,
        dark: true,
        loopTime: 75.0
    );
    addChild(_cloudsDark);

    _cloudsSoft = new CloudLayer(
        image: images['assets/images/clouds-1.png'],
        rotated: false,
        dark: false,
        loopTime: 100.0
    );
    addChild(_cloudsSoft);
  }

  ImageMap images;
  CloudLayer _cloudsSharp;
  CloudLayer _cloudsSoft;
  CloudLayer _cloudsDark;
}

class RainyWeather extends NodeWithSize {
  RainyWeather(this.spriteSheet): super(const Size(800,480)) {
    _rain = new Rain(spriteSheet['rain_drop.png']);
    _rain.active = true;
    addChild(_rain);
  }
  SpriteSheet spriteSheet;
  Rain _rain;
}

// Draws and animates a cloud layer using two sprites.
class CloudLayer extends Node {
  CloudLayer({ ui.Image image, bool dark, bool rotated, double loopTime }) {
    // Creates and positions the two cloud sprites.
    _sprites.add(_createSprite(image, dark, rotated));
    _sprites[0].position = const Offset(1024.0, 1024.0);
    _sprites[0].opacity = 1.0;
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

// Rain layer. Uses three layers of particle systems, to create a parallax
// rain effect.
class Rain extends Node {
  Rain(this.spriteTexture) {
    _addParticles(2.5);
    _addParticles(3.0);
    _addParticles(3.5);
  }

  SpriteTexture spriteTexture;

  List<ParticleSystem> _particles = <ParticleSystem>[];

  void _addParticles(double distance) {
    ParticleSystem particles = new ParticleSystem(
      spriteTexture,
      transferMode: BlendMode.srcATop,
      posVar: const Offset(1300.0, 0.0),
      direction: 90.0,
      directionVar: 0.0,
      speed: 1000.0 / distance,
      speedVar: 100.0 / distance,
      startSize: 1.2 / distance,
      startSizeVar: 0.2 / distance,
      endSize: 1.2 / distance,
      endSizeVar: 0.2 / distance,
      life: 1.5 * distance,
      lifeVar: 1.0 * distance
    );
    particles.position = const Offset(1024.0, -200.0);
    particles.rotation = 10.0;
    particles.opacity = 0.0;

    _particles.add(particles);
    addChild(particles);
  }

  set active(bool active) {
    motions.stopAll();
    for (ParticleSystem system in _particles) {
      if (active) {
        motions.run(
          new MotionTween<double>(
            (a) => system.opacity = a,
            system.opacity,
            1.0,
            2.0
        ));
      } else {
        motions.run(
          new MotionTween<double>(
            (a) => system.opacity = a,
            system.opacity,
            0.0,
            0.5
        ));
      }
    }
  }
}