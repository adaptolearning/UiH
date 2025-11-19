import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

import '../widgets/widgets.dart';

/// Demonstrates theme integration features of the UiH package.
///
/// Shows convenient access to color schemes, text themes, and other
/// theme properties through context extensions.
class ThemeIntegrationPage extends StatelessWidget {
  const ThemeIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Text(
          'Theme Integration',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        context.verticalSpacer(size: 16),

        // Color Scheme
        DemoCard(
          title: 'Color Scheme (context.colorScheme)',
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ColorChip('Primary', context.colorScheme.primary),
              ColorChip('Secondary', context.colorScheme.secondary),
              ColorChip('Tertiary', context.colorScheme.tertiary),
              ColorChip('Error', context.colorScheme.error),
              ColorChip('Surface', context.colorScheme.surface),
              ColorChip('Background', context.backgroundColor),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Text Theme
        DemoCard(
          title: 'Text Theme (context.textTheme)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Display Large', style: context.textTheme.displayLarge),
              SizedBox(height: 8.h),
              Text('Headline Large', style: context.textTheme.headlineLarge),
              SizedBox(height: 8.h),
              Text('Title Large', style: context.textTheme.titleLarge),
              SizedBox(height: 8.h),
              Text('Body Large', style: context.textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Text('Body Medium', style: context.textTheme.bodyMedium),
              SizedBox(height: 8.h),
              Text('Label Small', style: context.textTheme.labelSmall),
            ],
          ),
        ),

        context.verticalSpacer(size: 16),

        // Theme Info
        DemoCard(
          title: 'Theme Properties',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(
                'Brightness',
                context.brightness.toString().split('.').last,
              ),
              InfoRow(
                'Platform',
                context.theme.platform.toString().split('.').last,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
