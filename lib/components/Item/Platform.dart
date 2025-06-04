import 'package:flame/components.dart';

class Platform extends PositionComponent {
  bool isPlatform;
  Platform({
    position,
    size,
    this.isPlatform = false,
  }) : super(
          position: position,
          size: size,
        ) {
    // debugMode = true;
  }
}
