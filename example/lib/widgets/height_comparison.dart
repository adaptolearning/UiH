import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A widget that compares normal Flutter height with UiH responsive height.
///
/// Shows two containers side by side: one using standard height and another
/// using the UiH .h extension, with rotated text to show pixel values.
class HeightComparison extends StatelessWidget {
  /// The height value for the standard Flutter container.
  final double normalHeight;

  /// The height value to be used with .h extension.
  final double responsiveHeight;

  /// The label to display (e.g., "50", "100").
  final String label;

  const HeightComparison({
    required this.normalHeight,
    required this.responsiveHeight,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'height: $label',
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Normal height
            Column(
              children: [
                Text('Normal', style: TextStyle(fontSize: 10.sp)),
                SizedBox(height: 4.h),
                Container(
                  width: 80,
                  height: normalHeight,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.5),
                    border: Border.all(
                      color: context.colorScheme.outline,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      '${normalHeight.toInt()}px',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            // UiH responsive height
            Column(
              children: [
                Text(
                  'UiH (.h)',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: context.colorScheme.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 80,
                  height: responsiveHeight.h,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    border: Border.all(
                      color: context.colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      '${responsiveHeight.h.toInt()}px',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
