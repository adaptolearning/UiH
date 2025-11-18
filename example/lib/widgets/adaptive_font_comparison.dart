import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

/// A widget that compares normal Flutter font size with UiH's adaptive font (.af).
///
/// Shows side-by-side visual comparison between a fixed font size and the
/// same size using breakpoint-based adaptive scaling.
class AdaptiveFontComparison extends StatelessWidget {
  /// The font size to compare.
  final int size;

  const AdaptiveFontComparison(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final adaptiveSize = size.toDouble().af;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with font size
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(11),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Font Size',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '$size',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Normal font section
          _ComparisonSection(
            label: 'Normal',
            sizeLabel: '${size}px',
            sampleText: 'Sample Text',
            fontSize: size.toDouble(),
            textColor: colorScheme.onSurface,
            backgroundColor: colorScheme.surface,
            labelColor: colorScheme.onSurfaceVariant,
            isHighlighted: false,
          ),

          // Divider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(
              height: 1.h,
              thickness: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),

          // UiH adaptive font section
          _ComparisonSection(
            label: 'UiH (.af)',
            sizeLabel: '${adaptiveSize.toStringAsFixed(1)}px',
            sampleText: 'Sample Text',
            fontSize: adaptiveSize,
            textColor: colorScheme.primary,
            backgroundColor: colorScheme.primaryContainer.withValues(alpha: 0.15),
            labelColor: colorScheme.primary,
            isHighlighted: true,
          ),
        ],
      ),
    );
  }
}

/// Internal widget for displaying a comparison section (Normal or UiH).
class _ComparisonSection extends StatelessWidget {
  final String label;
  final String sizeLabel;
  final String sampleText;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final Color labelColor;
  final bool isHighlighted;

  const _ComparisonSection({
    required this.label,
    required this.sizeLabel,
    required this.sampleText,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
    required this.labelColor,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isHighlighted
            ? BorderRadius.vertical(bottom: Radius.circular(11))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label and size
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: labelColor,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: labelColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: labelColor.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  sizeLabel,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: labelColor,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Sample text
          Text(
            sampleText,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
