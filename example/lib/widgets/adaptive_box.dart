import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A colored box that demonstrates adaptive layout behavior.
///
/// Used to show how layouts can adapt between mobile (vertical stacking)
/// and tablet/desktop (horizontal arrangement) form factors.
class AdaptiveBox extends StatelessWidget {
  /// The text to display in the center of the box.
  final String text;

  /// The primary color for the box border and text.
  final Color color;

  const AdaptiveBox(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
