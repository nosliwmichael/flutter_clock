import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';

class TextureImage extends StatelessWidget {
  TextureImage({
    Key key,
    this.texture,
    this.width: 128.0,
    this.height: 128.0
  }) : super(key: key);

  final SpriteTexture texture;
  final double width;
  final double height;

  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: height,
      child: new CustomPaint(
        painter: new TextureImagePainter(texture, width, height)
      )
    );
  }
}

class TextureImagePainter extends CustomPainter {
  TextureImagePainter(this.texture, this.width, this.height);

  final SpriteTexture texture;
  final double width;
  final double height;

  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / texture.size.width, size.height / texture.size.height);
    texture.drawTexture(canvas, Offset.zero, new Paint());
    canvas.restore();
  }

  bool shouldRepaint(TextureImagePainter oldPainter) {
    return oldPainter.texture != texture
      || oldPainter.width != width
      || oldPainter.height != height;
  }
}