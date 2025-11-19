import 'package:flutter/material.dart';

/// A chip widget that displays a color with its label.
///
/// Shows a visual representation of the color as an avatar and
/// the color's name as text. Used to demonstrate theme color schemes.
class ColorChip extends StatelessWidget {
  /// The label text describing the color (e.g., "Primary", "Secondary").
  final String label;

  /// The color to display in the chip's avatar.
  final Color color;

  const ColorChip(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(backgroundColor: color),
      label: Text(label),
    );
  }
}
