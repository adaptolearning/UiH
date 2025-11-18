import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import '../widgets/widgets.dart';

/// Demonstrates font scaling features of the UiH package.
///
/// Shows the difference between diagonal-based scaling (.sp) and
/// breakpoint-based adaptive scaling (.af) with multiple font sizes.
class FontScalingPage extends StatelessWidget {
  const FontScalingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Font Scaling',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Scaled Font (.sp) Comparison
        DemoCard(
          title: 'Scaled Font (.sp) Comparison',
          subtitle: 'Flutter normal vs UiH diagonal-based (.sp)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScaledFontComparison(14),
              SizedBox(height: 12.h),
              const ScaledFontComparison(16),
              SizedBox(height: 12.h),
              const ScaledFontComparison(18),
              SizedBox(height: 12.h),
              const ScaledFontComparison(20),
              SizedBox(height: 12.h),
              const ScaledFontComparison(24),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Adaptive Font (.af) Comparison
        DemoCard(
          title: 'Adaptive Font (.af) Comparison',
          subtitle: 'Flutter normal vs UiH breakpoint-based (.af)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdaptiveFontComparison(14),
              SizedBox(height: 12.h),
              const AdaptiveFontComparison(16),
              SizedBox(height: 12.h),
              const AdaptiveFontComparison(18),
              SizedBox(height: 12.h),
              const AdaptiveFontComparison(20),
              SizedBox(height: 12.h),
              const AdaptiveFontComparison(24),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Comparison Table: .sp vs .af
        DemoCard(
          title: 'Comparison Table: .sp vs .af',
          subtitle: 'Actual scaled values on current device',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('.sp', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('.af', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(),
              const FontComparisonRow(14),
              const FontComparisonRow(16),
              const FontComparisonRow(18),
              const FontComparisonRow(20),
              const FontComparisonRow(24),
            ],
          ),
        ),
      ],
    );
  }
}
