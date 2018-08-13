import 'package:flutter/material.dart';

enum NipLocation { TOP, RIGHT, BOTTOM, LEFT }

class SpeechBubble extends StatelessWidget {
  /// Creates a widget that emulates a speech bubble.
  /// Could be used for a tooltip, or as a pop-up notification, etc.
  SpeechBubble(
      {Key key,
      @required this.child,
      this.nipLocation: NipLocation.BOTTOM,
      this.color: Colors.redAccent,
      this.borderRadius: 4.0,
      this.height,
      this.width,
      this.padding})
      : super(key: key);

  /// The [child] contained by the [SpeechBubble]
  final Widget child;

  /// The location of the nip of the speech bubble.
  ///
  /// Use [NipLocation] enum, either [TOP], [RIGHT], [BOTTOM], or [LEFT].
  /// The nip will automatically center to the side that it is assigned.
  final NipLocation nipLocation;

  /// The color of the body of the [SpeechBubble] and nip.
  /// Defaultly red.
  final Color color;

  /// The [borderRadius] of the [SpeechBubble].
  /// The [SpeechBubble] is built with a circular border radius on all 4 corners.
  final double borderRadius;

  /// The explicitly defined height of the [SpeechBubble].
  /// The [SpeechBubble] will defaultly enclose its [child].
  final double height;

  /// The explicitly defined width of the [SpeechBubble].
  /// The [SpeechBubble] will defaultly enclose its [child].
  final double width;

  /// The padding widget between the child and the edges of the [SpeechBubble].
  final Widget padding;

  Widget build(BuildContext context) {
    Offset nipOffset;
    switch (this.nipLocation) {
      case NipLocation.TOP:
        nipOffset = Offset(0.0, 7.07 - 1.5);
        break;
      case NipLocation.RIGHT:
        nipOffset = Offset(-7.07 + 1.5, 0.0);
        break;
      case NipLocation.BOTTOM:
        nipOffset = Offset(0.0, -7.07 + 1.5);
        break;
      case NipLocation.LEFT:
        nipOffset = Offset(7.07 - 1.5, 0.0);
        break;
      default:
    }

    if (this.nipLocation == NipLocation.TOP ||
        this.nipLocation == NipLocation.BOTTOM) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: this.nipLocation == NipLocation.BOTTOM
              ? list(nipOffset)
              : list(nipOffset).reversed.toList(),
        ),
      );
    } else {
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: this.nipLocation == NipLocation.RIGHT
              ? list(nipOffset)
              : list(nipOffset).reversed.toList(),
        ),
      );
    }
  }

  List<Widget> list(Offset nipOffset) {
    return <Widget>[
      speechBubble(),
      nip(nipOffset),
    ];
  }

  Widget speechBubble() {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(this.borderRadius),
      ),
      color: this.color,
      elevation: 1.0,
      child: Container(
        height: this.height,
        width: this.width,
        padding: this.padding ?? const EdgeInsets.all(8.0),
        child: this.child,
      ),
    );
  }

  Widget nip(Offset nipOffset) {
    return Transform.translate(
      offset: nipOffset,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(45 / 360),
        child: Material(
          borderRadius: BorderRadius.all(
            Radius.circular(1.5),
          ),
          color: this.color,
          child: Container(
            height: 10.0,
            width: 10.0,
          ),
        ),
      ),
    );
  }
}
