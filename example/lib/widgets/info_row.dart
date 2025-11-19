import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A row widget that displays a label-value pair with consistent styling.
///
/// Commonly used to display device information, screen dimensions, or other
/// key-value data in a horizontally aligned format.
class InfoRow extends StatelessWidget {
  /// The label text displayed on the left side.
  final String label;

  /// The value text displayed on the right side in bold.
  final String value;

  const InfoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14.sp)),
          Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
