import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import '../widgets/widgets.dart';

/// Demonstrates responsive sizing features of the UiH package.
///
/// Showcases width (.w), height (.h), and fraction (.wf) extensions
/// with side-by-side comparisons against standard Flutter sizing.
class ResponsiveSizingPage extends StatelessWidget {
  const ResponsiveSizingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Responsive Sizing',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Relative Width Comparison
        DemoCard(
          title: 'Relative Width Comparison',
          subtitle: 'Flutter normal vs UiH responsive (.w)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizeComparison(
                normalWidth: 100,
                responsiveWidth: 100,
                label: '100',
              ),
              SizedBox(height: 12.h),
              const SizeComparison(
                normalWidth: 200,
                responsiveWidth: 200,
                label: '200',
              ),
              SizedBox(height: 12.h),
              const SizeComparison(
                normalWidth: 300,
                responsiveWidth: 300,
                label: '300',
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Relative Height Comparison
        DemoCard(
          title: 'Relative Height Comparison',
          subtitle: 'Flutter normal vs UiH responsive (.h)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightComparison(
                normalHeight: 50,
                responsiveHeight: 50,
                label: '50',
              ),
              SizedBox(height: 12.h),
              const HeightComparison(
                normalHeight: 100,
                responsiveHeight: 100,
                label: '100',
              ),
              SizedBox(height: 12.h),
              const HeightComparison(
                normalHeight: 150,
                responsiveHeight: 150,
                label: '150',
              ),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Width Fraction Comparison
        DemoCard(
          title: 'Width Fraction Comparison',
          subtitle: 'MediaQuery vs UiH fraction (.wf)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FractionComparison(fraction: 0.5, label: '50% width'),
              SizedBox(height: 12.h),
              const FractionComparison(fraction: 0.75, label: '75% width'),
              SizedBox(height: 12.h),
              const FractionComparison(fraction: 0.9, label: '90% width'),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Screen Dimensions Info
        DemoCard(
          title: 'Screen Dimensions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(
                'Width (pixels)',
                context.widthInPixels.toStringAsFixed(0),
              ),
              InfoRow(
                'Height (pixels)',
                context.heightInPixels.toStringAsFixed(0),
              ),
              InfoRow(
                'Diagonal (pixels)',
                context.diagonalInPixels.toStringAsFixed(0),
              ),
              InfoRow(
                'Width (inches)',
                '${context.widthInInches.toStringAsFixed(2)}"',
              ),
              InfoRow(
                'Height (inches)',
                '${context.heightInInches.toStringAsFixed(2)}"',
              ),
              InfoRow(
                'Diagonal (inches)',
                '${context.diagonalInInches.toStringAsFixed(2)}"',
              ),
              InfoRow('PPI', context.pixelsPerInch.toStringAsFixed(0)),
            ],
          ),
        ),
      ],
    );
  }
}
