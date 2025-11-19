import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A widget that compares normal Flutter width with UiH responsive width.
///
/// Shows two containers side by side: one using standard width and another
/// using the UiH .w extension, demonstrating the difference in responsive sizing.
class SizeComparison extends StatelessWidget {
  /// The width value for the standard Flutter container.
  final double normalWidth;

  /// The width value to be used with .w extension.
  final double responsiveWidth;

  /// The label to display (e.g., "100", "200").
  final String label;

  const SizeComparison({
    required this.normalWidth,
    required this.responsiveWidth,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Normal width
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Normal: width: $label',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4.h),
            Container(
              width: normalWidth,
              height: 40,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                border: Border.all(
                  color: context.colorScheme.outline,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                '${normalWidth.toInt()}px',
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        // UiH responsive width
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UiH: width: $label.w',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: context.colorScheme.primary,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: responsiveWidth.w,
              height: 40,
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                '${responsiveWidth.w.toInt()}px',
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
