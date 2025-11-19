import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A row that compares .sp and .af font scaling for a given size.
///
/// Displays the base size and calculated values for both diagonal-based
/// scaling (.sp) and adaptive breakpoint-based scaling (.af).
class FontComparisonRow extends StatelessWidget {
  /// The base font size to compare.
  final int size;

  const FontComparisonRow(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$size', style: TextStyle(fontSize: 14.sp)),
          Text(
            size.toDouble().sp.toStringAsFixed(1),
            style: TextStyle(fontSize: 14.sp),
          ),
          Text(
            size.toDouble().af.toStringAsFixed(1),
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
