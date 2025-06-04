import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:demo/components/Player/player.dart';
import 'package:demo/GamePlay.dart';

class Checkpoint extends SpriteAnimationComponent
    with HasGameReference<GamePlay>, CollisionCallbacks {
  Checkpoint({
    position,
    size,
  }) : super(
          position: position,
          size: size,
        );

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    add(RectangleHitbox(
      position: Vector2(3, 12),
      size: Vector2(60, 50),
      collisionType: CollisionType.passive,
    ));

    animation = SpriteAnimation.fromFrameData(
      game.images
          .fromCache('Items/Checkpoints/Checkpoint/Checkpoint (No Flag).png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 1,
        textureSize: Vector2(46, 56),
      ),
    );
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) _reachedCheckpoint();
    super.onCollisionStart(intersectionPoints, other);
  }

  void _reachedCheckpoint() async {
    // animation = SpriteAnimation.fromFrameData(
    //   game.images.fromCache(
    //       'Items/Checkpoints/Checkpoint/Checkpoint (Flag Out) (64x64).png'),
    //   SpriteAnimationData.sequenced(
    //     amount: 26,
    //     stepTime: 0.05,
    //     textureSize: Vector2.all(64),
    //     loop: false,
    //   ),
    // );
    //
    // await animationTicker?.completed;

    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(
          'Items/Checkpoints/Checkpoint/Checkpoint (Flag Idle)(64x64).png'),
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.05,
        textureSize: Vector2(46, 56),
        loop: false,
      ),
    );
  }
}
