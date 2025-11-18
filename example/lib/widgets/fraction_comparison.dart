import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A widget that compares MediaQuery width fraction with UiH .wf extension.
///
/// Shows two containers stacked vertically: one using MediaQuery.of(context).size.width
/// and another using the UiH .wf extension, demonstrating equivalent functionality.
class FractionComparison extends StatelessWidget {
  /// The fraction of screen width to use (e.g., 0.5 for 50%).
  final double fraction;

  /// The label to display (e.g., "50% width").
  final String label;

  const FractionComparison({
    required this.fraction,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width * fraction;
    final uihWidth = fraction.wf;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MediaQuery: $label',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: mediaQueryWidth,
                    height: 40,
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
                    child: Text(
                      '${mediaQueryWidth.toInt()}px',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UiH: $fraction.wf',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: uihWidth,
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
                      '${uihWidth.toInt()}px',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
